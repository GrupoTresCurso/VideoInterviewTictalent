var contador = 0;
var contador2=0;
var formularioCargado=0;
var elementoMovido = null;
var contenedorActual = null;

var idElementoSeleccionado = null;
var etiquetaElementoSeleccionado = null;
var opcionesElementoSeleccionado = null;
var numOpcionesElementoSeleccinado = null;
var tipo = null;
var elementoPredefinido = null;
var numElementosPredefinidos;

ajustarTamanioPagina();

function ajustarTamanioPagina() {
    $('#medio').css('width', ($(window).width()-$('#izquierda').width()) + 'px');
    $('#contenedor').css('height', ($(window).height()*0.895) + 'px');
}


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

var recordingDIV = document.querySelector('.recordrtc');
var recordingMedia = 'record-audio-plus-video';
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

    if(button.innerHTML === '<img src="images/stop.png" width="40px" height="40px">') {
        btnPauseRecording.style.display = 'none';
        button.disabled = true;
        button.disableStateWaiting = true;
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

            button.innerHTML = '<img src="images/stop.png" width="40px" height="40px">';
            button.disabled = false;
        },
        onMediaStopped: function() {
            button.innerHTML = '<img src="images/record.png" width="40px" height="40px">';

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

    mimeType = 'video/webm\;codecs=h264';
    fileExtension = 'mp4';
    recorderType = null;
    type = 'video';


    if(recordingMedia === 'record-audio-plus-video') {
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


var videoBitsPerSecond;
videoBitsPerSecond = null;

function setGetFromLocalStorage(selectors) {
    selectors.forEach(function(selector) {
        var storageItem = selector.replace(/\.|#/g, '');
        if(localStorage.getItem(storageItem)) {
            document.querySelector(selector).value = localStorage.getItem(storageItem);
        }


    });
}

setGetFromLocalStorage(['.recording-media', '.media-container-format']);

function captureUserMedia(mediaConstraints, successCallback, errorCallback) {
    if(mediaConstraints.video == true) {
        mediaConstraints.video = {};
    }

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
    setMediaContainerFormat(['vp8']);
};

function saveToDiskOrOpenNewTab(recordRTC) {
    var fileName = 'VIDEO-' + (new Date).toISOString().replace(/:|\./g, '-') + '.' + fileExtension;

    recordingDIV.querySelector('#save-to-disk').parentNode.style.display = 'block';
    recordingDIV.querySelector('#save-to-disk').onclick = function() {
        if(!recordRTC) return alert('No recording found.');

        var file = new File([recordRTC.getBlob()], fileName, {
            type: mimeType
        });

        invokeSaveAsDialog(file, file.name);
    };

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
            btnPauseRecording.innerHTML = '<img src="images/pause.png" width="40px" height="40px">';
            btnPauseRecording.disabled = false;
        }, 2000);
    }

    if(btnPauseRecording.innerHTML === 'Resume Recording') {
        btnStartRecording.disabled = false;
        btnStartRecording.style.fontSize = 'inherit';
        btnStartRecording.recordRTC.resumeRecording();
        recordingPlayer.play();

        btnPauseRecording.style.fontSize = '15px';
        btnPauseRecording.innerHTML = '<img src="images/pause.png" width="40px" height="40px">';
        setTimeout(function() {
            btnPauseRecording.disabled = false;
        }, 2000);
    }
};