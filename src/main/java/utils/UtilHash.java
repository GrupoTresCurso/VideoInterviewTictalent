package utils;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

@Service
public class UtilHash implements BaseUtil {

    public static String doHash(String password){
        return DigestUtils.sha512Hex(password);
    }

}
