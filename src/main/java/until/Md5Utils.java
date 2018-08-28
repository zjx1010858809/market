package until;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by hp on 2016/11/28.
 */
public class Md5Utils {
 
    public static String md5(String plainText){
        //定义一个字节数组，接收加密完成的密码
        byte[] secretBytes=null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        String md5code=new BigInteger(1,secretBytes).toString(16);//16进制数字
        //如果生成的数字未满32位，要在前面补0
        for (int i=0;i<32-md5code.length();i++){
            md5code="0"+md5code;
        }
        return md5code;
    }
    //测试方法
    public static void main(String[] args) {
        System.out.println(md5("123"));
    }
}
