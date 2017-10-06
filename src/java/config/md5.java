package config;
import java.security.*;
public class md5 {
    public String md5(String password) throws NoSuchAlgorithmException{
    MessageDigest alg = MessageDigest.getInstance("MD5");
    alg.reset(); 
    alg.update(password.getBytes());
    byte[] digest = alg.digest();
    StringBuffer hashedpasswd = new StringBuffer();
    String hx;
      for (int i=0;i<digest.length;i++){
	hx =  Integer.toHexString(0xFF & digest[i]);
	if(hx.length() == 1){hx = "0" + hx;}
	hashedpasswd.append(hx);        
       }
      String pass=hashedpasswd.toString();
      return pass;
    
    }
}
