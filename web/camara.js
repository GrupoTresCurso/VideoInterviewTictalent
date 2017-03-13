
(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }

    var match, search = window.location.search;
    while (match = r.exec(search.substring(1))) {
        params[d(match[1])] = d(match[2]);

        if(d(match[2]) === 'true' || d(match[2]) === 'false') {
            params[d(match[1])] = d(match[2]) === 'true' ? true : false;
        }
    }

    window.params = params;
})();

function addStreamStopListener(stream, callback) {
    var streamEndedEvent = 'ended';

    if ('oninactive' in stream) {
        streamEndedEvent = 'inactive';
    }

    stream.addEventListener(streamEndedEvent, function() {
        callback();
        callback = function() {};
    }, false);

    stream.getAudioTracks().forEach(function(track) {
        track.addEventListener(streamEndedEvent, function() {
            callback();
            callback = function() {};
        }, false);
    });

    stream.getVideoTracks().forEach(function(track) {
        track.addEventListener(streamEndedEvent, function() {
            callback();
            callback = function() {};
        }, false);
    });
}

function intallFirefoxScreenCapturingExtension() {
    InstallTrigger.install({
        'Foo': {
            // URL: 'https://addons.mozilla.org/en-US/firefox/addon/enable-screen-capturing/',
            URL: 'https://addons.mozilla.org/firefox/downloads/file/355418/enable_screen_capturing_in_firefox-1.0.006-fx.xpi?src=cb-dl-hotness',
            toString: function() {
                return this.URL;
            }
        }
    });
}

var recordingDIV = document.querySelector('.recordrtc');
var recordingMedia = document.querySelector('.recording-media');
var recordingPlayer = recordingDIV.querySelector('video');
var mimeType = 'video/webm';
var fileExtension = 'webm';
var type = 'video';
var recorderType;
var defaultWidth;
var defaultHeight;

var btnStartRecording = document.querySelector('#btn-start-recording');

window.onbeforeunload = function() {
    btnStartRecording.disabled = false;
    mediaContainerFormat.disabled = false;
};

btnStartRecording.onclick = function(event) {
    var button = btnStartRecording;

    if(button.innerHTML === 'Stop Recording') {
        btnPauseRecording.style.display = 'none';
        button.disabled = true;
        button.disableStateWaiting = true;
        setTimeout(function() {
            button.disabled = false;
            button.disableStateWaiting = false;
        }, 2000);

        button.innerHTML = 'Star Recording';

        function stopStream() {
            if(button.stream && button.stream.stop) {
                button.stream.stop();
                button.stream = null;
            }

            if(button.stream instanceof Array) {
                button.stream.forEach(function(stream) {
                    stream.stop();
                });
                button.stream = null;
            }

            videoBitsPerSecond = null;
        }

        if(button.recordRTC) {
            if(button.recordRTC.length) {
                button.recordRTC[0].stopRecording(function(url) {
                    if(!button.recordRTC[1]) {
                        button.recordingEndedCallback(url);
                        stopStream();

                        saveToDiskOrOpenNewTab(button.recordRTC[0]);
                        return;
                    }

                    button.recordRTC[1].stopRecording(function(url) {
                        button.recordingEndedCallback(url);
                        stopStream();
                    });
                });
            }
            else {
                button.recordRTC.stopRecording(function(url) {
                    button.recordingEndedCallback(url);
                    stopStream();

                    saveToDiskOrOpenNewTab(button.recordRTC);
                });
            }
        }

        return;
    }

    if(!event) return;

    button.disabled = true;

    var commonConfig = {
        onMediaCaptured: function(stream) {
            button.stream = stream;
            if(button.mediaCapturedCallback) {
                button.mediaCapturedCallback();
            }

            button.innerHTML = 'Stop Recording';
            button.disabled = false;
        },
        onMediaStopped: function() {
            button.innerHTML = 'Start Recording';

            if(!button.disableStateWaiting) {
                button.disabled = false;
            }
        },
        onMediaCapturingFailed: function(error) {
            if(error.name === 'PermissionDeniedError' && !!navigator.mozGetUserMedia) {
                intallFirefoxScreenCapturingExtension();
            }

            commonConfig.onMediaStopped();
        }
    };


    mimeType = 'video/webm\;codecs=vp8';
    fileExtension = 'webm';
    recorderType = null;
    type = 'video';


    if(recordingMedia.value === 'record-audio-plus-video') {
        captureAudioPlusVideo(commonConfig);

        button.mediaCapturedCallback = function() {
            if(typeof MediaRecorder === 'undefined') { // opera or chrome etc.
                button.recordRTC = [];

                if(!params.bufferSize) {
                    // it fixes audio issues whilst recording 720p
                    params.bufferSize = 16384;
                }

                var options = {
                    type: 'audio', // hard-code to set "audio"
                    leftChannel: params.leftChannel || false,
                    disableLogs: params.disableLogs || false,
                    video: recordingPlayer
                };

                if(params.sampleRate) {
                    options.sampleRate = parseInt(params.sampleRate);
                }

                if(params.bufferSize) {
                    options.bufferSize = parseInt(params.bufferSize);
                }

                if(params.frameInterval) {
                    options.frameInterval = parseInt(params.frameInterval);
                }

                if(recorderType) {
                    options.recorderType = recorderType;
                }

                if(videoBitsPerSecond) {
                    options.videoBitsPerSecond = videoBitsPerSecond;
                }


                var audioRecorder = RecordRTC(button.stream, options);

                options.type = type;
                var videoRecorder = RecordRTC(button.stream, options);

                // to sync audio/video playbacks in browser!
                videoRecorder.initRecorder(function() {
                    audioRecorder.initRecorder(function() {
                        audioRecorder.startRecording();
                        videoRecorder.startRecording();
                        btnPauseRecording.style.display = '';
                    });
                });

                button.recordRTC.push(audioRecorder, videoRecorder);

                button.recordingEndedCallback = function() {
                    var audio = new Audio();
                    audio.src = audioRecorder.toURL();
                    audio.controls = true;
                    audio.autoplay = true;

                    recordingPlayer.parentNode.appendChild(document.createElement('hr'));
                    recordingPlayer.parentNode.appendChild(audio);

                    if(audio.paused) audio.play();
                };
                return;
            }

            var options = {
                type: type,
                mimeType: mimeType,
                disableLogs: params.disableLogs || false,
                getNativeBlob: false, // enable it for longer recordings
                video: recordingPlayer
            };

            if(recorderType) {
                options.recorderType = recorderType;

                if(recorderType == WhammyRecorder || recorderType == GifRecorder) {
                    options.canvas = options.video = {
                        width: defaultWidth || 320,
                        height: defaultHeight || 240
                    };
                }
            }

            if(videoBitsPerSecond) {
                options.videoBitsPerSecond = videoBitsPerSecond;
            }


            button.recordRTC = RecordRTC(button.stream, options);

            button.recordingEndedCallback = function(url) {
                setVideoURL(url);
            };

            button.recordRTC.startRecording();
            btnPauseRecording.style.display = '';
        };
    }

};

function captureVideo(config) {
    captureUserMedia({video: true}, function(videoStream) {
        config.onMediaCaptured(videoStream);

        addStreamStopListener(videoStream, function() {
            config.onMediaStopped();
        });
    }, function(error) {
        config.onMediaCapturingFailed(error);
    });
}

function captureAudio(config) {
    captureUserMedia({audio: true}, function(audioStream) {
        config.onMediaCaptured(audioStream);

        addStreamStopListener(audioStream, function() {
            config.onMediaStopped();
        });
    }, function(error) {
        config.onMediaCapturingFailed(error);
    });
}

function captureAudioPlusVideo(config) {
    captureUserMedia({video: true, audio: true}, function(audioVideoStream) {
        config.onMediaCaptured(audioVideoStream);

        if(audioVideoStream instanceof Array) {
            audioVideoStream.forEach(function(stream) {
                addStreamStopListener(stream, function() {
                    config.onMediaStopped();
                });
            });
            return;
        }

        addStreamStopListener(audioVideoStream, function() {
            config.onMediaStopped();
        });
    }, function(error) {
        config.onMediaCapturingFailed(error);
    });
}

function captureScreen(config) {
    window.getScreenId = function(chromeMediaSource, chromeMediaSourceId) {
        var screenConstraints = {
            audio: false,
            video: {
                mandatory: {
                    chromeMediaSourceId: chromeMediaSourceId,
                    chromeMediaSource: chromeMediaSource
                }
            }
        };

        if(webrtcDetectedBrowser == 'firefox') {
            screenConstraints = {
                video: {
                    mediaSource: 'window'
                }
            }
        }

        captureUserMedia(screenConstraints, function(screenStream) {
            config.onMediaCaptured(screenStream);

            addStreamStopListener(screenStream, function() {
                // config.onMediaStopped();

                btnStartRecording.onclick();
            });
        }, function(error) {
            config.onMediaCapturingFailed(error);
        });
    };

    if(webrtcDetectedBrowser == 'firefox') {
        window.getScreenId();
    }

    window.postMessage('get-sourceId', '*');
}

function captureAudioPlusScreen(config) {
    window.getScreenId = function(chromeMediaSource, chromeMediaSourceId) {
        var screenConstraints = {
            audio: false,
            video: {
                mandatory: {
                    chromeMediaSourceId: chromeMediaSourceId,
                    chromeMediaSource: chromeMediaSource
                }
            }
        };

        if(webrtcDetectedBrowser == 'firefox') {
            screenConstraints = {
                video: {
                    mediaSource: 'window',
                },
                audio: true
            }
        }

        captureUserMedia(screenConstraints, function(screenStream) {
            if(webrtcDetectedBrowser == 'firefox') {
                config.onMediaCaptured(screenStream);

                addStreamStopListener(screenStream, function() {
                    config.onMediaStopped();
                });
                return;
            }

            captureUserMedia({audio: true}, function(audioStream) {
                // merge audio tracks into the screen
                screenStream.addTrack(audioStream.getAudioTracks()[0]);

                config.onMediaCaptured(screenStream);

                addStreamStopListener(screenStream, function() {
                    config.onMediaStopped();
                });
            }, function(error) {
                config.onMediaCapturingFailed(error);
            });
        }, function(error) {
            config.onMediaCapturingFailed(error);
        });
    };

    if(webrtcDetectedBrowser == 'firefox') {
        window.getScreenId();
    }

    window.postMessage('get-sourceId', '*');
}

var videoBitsPerSecond;
videoBitsPerSecond = null;

function setGetFromLocalStorage(selectors) {
    selectors.forEach(function(selector) {
        var storageItem = selector.replace(/\.|#/g, '');
        if(localStorage.getItem(storageItem)) {
            document.querySelector(selector).value = localStorage.getItem(storageItem);
        }

        addEventListenerToUploadLocalStorageItem(selector, ['change', 'blur'], function() {
            localStorage.setItem(storageItem, document.querySelector(selector).value);
        });
    });
}

function addEventListenerToUploadLocalStorageItem(selector, arr, callback) {
    arr.forEach(function(event) {
        document.querySelector(selector).addEventListener(event, callback, false);
    });
}

setGetFromLocalStorage(['.media-resolutions', '.media-framerates', '.media-bitrates', '.recording-media', '.media-container-format']);

function captureUserMedia(mediaConstraints, successCallback, errorCallback) {
    if(mediaConstraints.video == true) {
        mediaConstraints.video = {};
    }

    mediaConstraints = mediaConstraints;
    mediaConstraints = mediaConstraints;

    var isBlackBerry = !!(/BB10|BlackBerry/i.test(navigator.userAgent || ''));
    if(isBlackBerry && !!(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia)) {
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
        navigator.getUserMedia(mediaConstraints, successCallback, errorCallback);
        return;
    }

    navigator.mediaDevices.getUserMedia(mediaConstraints).then(function(stream) {
        successCallback(stream);

        setVideoURL(stream, true);
    }).catch(function(error) {
        if(error && error.name === 'ConstraintNotSatisfiedError') {
            alert('Your camera or browser does NOT supports selected resolutions or frame-rates. \n\nPlease select "default" resolutions.');
        }

        errorCallback(error);
    });
}

function setMediaContainerFormat(arrayOfOptionsSupported) {
    var options = Array.prototype.slice.call(
        mediaContainerFormat.querySelectorAll('option')
    );

    var localStorageItem;
    if(localStorage.getItem('media-container-format')) {
        localStorageItem = localStorage.getItem('media-container-format');
    }

    var selectedItem;
    options.forEach(function(option) {
        option.disabled = true;

        if(arrayOfOptionsSupported.indexOf(option.value) !== -1) {
            option.disabled = false;

            if(localStorageItem && arrayOfOptionsSupported.indexOf(localStorageItem) != -1) {
                if(option.value != localStorageItem) return;
                option.selected = true;
                selectedItem = option;
                return;
            }

            if(!selectedItem) {
                option.selected = true;
                selectedItem = option;
            }
        }
    });
}

recordingMedia.onchange = function() {
    var options = [];
    if(recordingMedia.value === 'record-audio') {
        setMediaContainerFormat(['opus', 'pcm']);
        return;
    }
    setMediaContainerFormat(['vp8', 'vp9', 'h264', 'gif', 'whammy']);
};
recordingMedia.onchange();

if(webrtcDetectedBrowser === 'edge') {
    // webp isn't supported in Microsoft Edge
    // neither MediaRecorder API
    // so lets disable both video/screen recording options

    console.warn('Neither MediaRecorder API nor webp is supported in Microsoft Edge. You cam merely record audio.');

    recordingMedia.innerHTML = '<option value="record-audio">Audio</option>';
    setMediaContainerFormat(['WAV']);
}

function saveToDiskOrOpenNewTab(recordRTC) {
    var fileName = 'RecordRTC-' + (new Date).toISOString().replace(/:|\./g, '-') + '.' + fileExtension;

    recordingDIV.querySelector('#save-to-disk').parentNode.style.display = 'block';
    recordingDIV.querySelector('#save-to-disk').onclick = function() {
        if(!recordRTC) return alert('No recording found.');

        var file = new File([recordRTC.getBlob()], fileName, {
            type: mimeType
        });

        invokeSaveAsDialog(file, file.name);
    };

    // upload to PHP server
    recordingDIV.querySelector('#upload-to-php').disabled = false;
    recordingDIV.querySelector('#upload-to-php').onclick = function() {
        if(!recordRTC) return alert('No recording found.');
        this.disabled = true;

        var button = this;
        uploadToPHPServer(fileName, recordRTC, function(progress, fileURL) {
            if(progress === 'ended') {
                button.disabled = false;
                button.innerHTML = 'Click to download from server';
                button.onclick = function() {
                    SaveFileURLToDisk(fileURL, fileName);
                };

                setVideoURL(fileURL);
                return;
            }
            button.innerHTML = progress;
        });
    };

}

function uploadToPHPServer(fileName, recordRTC, callback) {
    var blob = recordRTC instanceof Blob ? recordRTC : recordRTC.getBlob();

    blob = new File([blob], 'RecordRTC-' + (new Date).toISOString().replace(/:|\./g, '-') + '.' + fileExtension, {
        type: mimeType
    });

    // create FormData
    var formData = new FormData();
    formData.append('video-filename', fileName);
    formData.append('video-blob', blob);

    callback('Uploading recorded-file to server.');

    makeXMLHttpRequest('https://webrtcweb.com/RecordRTC/', formData, function(progress) {
        if (progress !== 'upload-ended') {
            callback(progress);
            return;
        }

        var initialURL = 'https://webrtcweb.com/RecordRTC/uploads/';

        callback('ended', initialURL + fileName);
    });
}

function makeXMLHttpRequest(url, data, callback) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200) {
            callback('upload-ended');
        }
    };

    request.upload.onloadstart = function() {
        callback('Upload started...');
    };

    request.upload.onprogress = function(event) {
        callback('Upload Progress ' + Math.round(event.loaded / event.total * 100) + "%");
    };

    request.upload.onload = function() {
        callback('progress-about-to-end');
    };

    request.upload.onload = function() {
        callback('progress-ended');
    };

    request.upload.onerror = function(error) {
        callback('Failed to upload to server');
    };

    request.upload.onabort = function(error) {
        callback('Upload aborted.');
    };

    request.open('POST', url);
    request.send(data);
}

function SaveFileURLToDisk(fileUrl, fileName) {
    var hyperlink = document.createElement('a');
    hyperlink.href = fileUrl;
    hyperlink.target = '_blank';
    hyperlink.download = fileName || fileUrl;

    (document.body || document.documentElement).appendChild(hyperlink);
    hyperlink.onclick = function() {
        (document.body || document.documentElement).removeChild(hyperlink);
    };

    var mouseEvent = new MouseEvent('click', {
        view: window,
        bubbles: true,
        cancelable: true
    });

    hyperlink.dispatchEvent(mouseEvent);

    // NEVER use "revoeObjectURL" here
    // you can use it inside "onclick" handler, though.
    // (window.URL || window.webkitURL).revokeObjectURL(hyperlink.href);

    // if you're writing cross-browser function:
    if(!navigator.mozGetUserMedia) { // i.e. if it is NOT Firefox
        window.URL.revokeObjectURL(hyperlink.href);
    }
}

function getURL(arg) {
    var url = arg;

    if(arg instanceof Blob || arg instanceof File) {
        url = URL.createObjectURL(arg);
    }

    if(arg instanceof RecordRTC || arg.getBlob) {
        url = URL.createObjectURL(arg.getBlob());
    }

    if(arg instanceof MediaStream || arg.getTracks || arg.getVideoTracks) {
        url = URL.createObjectURL(arg);
    }

    return url;
}

function setVideoURL(arg, forceNonImage) {
    var url = getURL(arg);

    var parentNode = recordingPlayer.parentNode;
    parentNode.removeChild(recordingPlayer);
    parentNode.innerHTML = '';

    var elem = 'video';
    if(type == 'gif' && !forceNonImage) {
        elem = 'img';
    }
    if(type == 'audio') {
        elem = 'audio';
    }

    recordingPlayer = document.createElement(elem);

    if(arg instanceof MediaStream) {
        recordingPlayer.muted = true;
    }

    recordingPlayer.addEventListener('loadedmetadata', function() {
        if(navigator.userAgent.toLowerCase().indexOf('android') == -1) return;

        // android
        setTimeout(function() {
            if(typeof recordingPlayer.play === 'function') {
                recordingPlayer.play();
            }
        }, 2000);
    }, false);

    recordingPlayer.poster = '';
    recordingPlayer.src = url;

    if(typeof recordingPlayer.play === 'function') {
        recordingPlayer.play();
    }

    recordingPlayer.addEventListener('ended', function() {
        url = getURL(arg);
        recordingPlayer.src = url;
    });

    recordingPlayer.controls = true;
    parentNode.appendChild(recordingPlayer);
}

/* cors_upload.js Copyright 2015 Google Inc. All Rights Reserved. */

var DRIVE_UPLOAD_URL = 'https://www.googleapis.com/upload/drive/v2/files/';

var RetryHandler = function() {
    this.interval = 1000; // Start at one second
    this.maxInterval = 60 * 1000; // Don't wait longer than a minute
};

RetryHandler.prototype.retry = function(fn) {
    setTimeout(fn, this.interval);
    this.interval = this.nextInterval_();
};

RetryHandler.prototype.reset = function() {
    this.interval = 1000;
};

RetryHandler.prototype.nextInterval_ = function() {
    var interval = this.interval * 2 + this.getRandomInt_(0, 1000);
    return Math.min(interval, this.maxInterval);
};

RetryHandler.prototype.getRandomInt_ = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
};

var MediaUploader = function(options) {
    var noop = function() {};
    this.file = options.file;
    this.contentType = options.contentType || this.file.type || 'application/octet-stream';
    this.metadata = options.metadata || {
            'title': this.file.name,
            'mimeType': this.contentType
        };
    this.token = options.token;
    this.onComplete = options.onComplete || noop;
    this.onProgress = options.onProgress || noop;
    this.onError = options.onError || noop;
    this.offset = options.offset || 0;
    this.chunkSize = options.chunkSize || 0;
    this.retryHandler = new RetryHandler();

    this.url = options.url;
    if (!this.url) {
        var params = options.params || {};
        params.uploadType = 'resumable';
        this.url = this.buildUrl_(options.fileId, params, options.baseUrl);
    }
    this.httpMethod = options.fileId ? 'PUT' : 'POST';
};

MediaUploader.prototype.upload = function() {
    var self = this;
    var xhr = new XMLHttpRequest();

    xhr.open(this.httpMethod, this.url, true);
    xhr.setRequestHeader('Authorization', 'Bearer ' + this.token);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('X-Upload-Content-Length', this.file.size);
    xhr.setRequestHeader('X-Upload-Content-Type', this.contentType);

    xhr.onload = function(e) {
        if (e.target.status < 400) {
            var location = e.target.getResponseHeader('Location');
            this.url = location;
            this.sendFile_();
        } else {
            this.onUploadError_(e);
        }
    }.bind(this);
    xhr.onerror = this.onUploadError_.bind(this);
    xhr.send(JSON.stringify(this.metadata));
};

MediaUploader.prototype.sendFile_ = function() {
    var content = this.file;
    var end = this.file.size;

    if (this.offset || this.chunkSize) {
        // Only bother to slice the file if we're either resuming or uploading in chunks
        if (this.chunkSize) {
            end = Math.min(this.offset + this.chunkSize, this.file.size);
        }
        content = content.slice(this.offset, end);
    }

    var xhr = new XMLHttpRequest();
    xhr.open('PUT', this.url, true);
    xhr.setRequestHeader('Content-Type', this.contentType);
    xhr.setRequestHeader('Content-Range', 'bytes ' + this.offset + '-' + (end - 1) + '/' + this.file.size);
    xhr.setRequestHeader('X-Upload-Content-Type', this.file.type);
    if (xhr.upload) {
        xhr.upload.addEventListener('progress', this.onProgress);
    }
    xhr.onload = this.onContentUploadSuccess_.bind(this);
    xhr.onerror = this.onContentUploadError_.bind(this);
    xhr.send(content);
};

MediaUploader.prototype.resume_ = function() {
    var xhr = new XMLHttpRequest();
    xhr.open('PUT', this.url, true);
    xhr.setRequestHeader('Content-Range', 'bytes */' + this.file.size);
    xhr.setRequestHeader('X-Upload-Content-Type', this.file.type);
    if (xhr.upload) {
        xhr.upload.addEventListener('progress', this.onProgress);
    }
    xhr.onload = this.onContentUploadSuccess_.bind(this);
    xhr.onerror = this.onContentUploadError_.bind(this);
    xhr.send();
};

MediaUploader.prototype.extractRange_ = function(xhr) {
    var range = xhr.getResponseHeader('Range');
    if (range) {
        this.offset = parseInt(range.match(/\d+/g).pop(), 10) + 1;
    }
};

MediaUploader.prototype.onContentUploadSuccess_ = function(e) {
    if (e.target.status == 200 || e.target.status == 201) {
        this.onComplete(e.target.response);
    } else if (e.target.status == 308) {
        this.extractRange_(e.target);
        this.retryHandler.reset();
        this.sendFile_();
    }
};

MediaUploader.prototype.onContentUploadError_ = function(e) {
    if (e.target.status && e.target.status < 500) {
        this.onError(e.target.response);
    } else {
        this.retryHandler.retry(this.resume_.bind(this));
    }
};

MediaUploader.prototype.onUploadError_ = function(e) {
    this.onError(e.target.response); // TODO - Retries for initial upload
};

MediaUploader.prototype.buildQuery_ = function(params) {
    params = params || {};
    return Object.keys(params).map(function(key) {
        return encodeURIComponent(key) + '=' + encodeURIComponent(params[key]);
    }).join('&');
};

MediaUploader.prototype.buildUrl_ = function(id, params, baseUrl) {
    var url = baseUrl || DRIVE_UPLOAD_URL;
    if (id) {
        url += id;
    }
    var query = this.buildQuery_(params);
    if (query) {
        url += '?' + query;
    }
    return url;
};

var btnPauseRecording = document.querySelector('#btn-pause-recording');
btnPauseRecording.onclick = function() {
    if(!btnStartRecording.recordRTC) {
        btnPauseRecording.style.display = 'none';
        return;
    }

    btnPauseRecording.disabled = true;
    if(btnPauseRecording.innerHTML === 'Pause') {
        btnStartRecording.disabled = true;
        btnStartRecording.style.fontSize = '15px';
        btnStartRecording.recordRTC.pauseRecording();
        recordingPlayer.pause();

        btnPauseRecording.style.fontSize = 'inherit';
        setTimeout(function() {
            btnPauseRecording.innerHTML = 'Resume Recording';
            btnPauseRecording.disabled = false;
        }, 2000);
    }

    if(btnPauseRecording.innerHTML === 'Resume Recording') {
        btnStartRecording.disabled = false;
        btnStartRecording.style.fontSize = 'inherit';
        btnStartRecording.recordRTC.resumeRecording();
        recordingPlayer.play();

        btnPauseRecording.style.fontSize = '15px';
        btnPauseRecording.innerHTML = 'Pause';
        setTimeout(function() {
            btnPauseRecording.disabled = false;
        }, 2000);
    }
};
