package com.distapp.beans;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Scanner;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import javax.crypto.*;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.crypto.spec.PBEParameterSpec;
import com.distapp.beans.WinRegistry;

/** 
 * Encryption and Decryption of String data; PBE(Password Based Encryption and Decryption)
 * 
 */
public class CryptoUtilStandAlone {

    Cipher ecipher;
    Cipher dcipher;
    private static String sn = null;
    // 8-byte Salt
    byte[] salt = {
        (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
        (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
    };
    // Iteration count
    int iterationCount = 19;
    public CryptoUtilStandAlone() { 

    }

    /**
     * 
     * @param secretKey Key used to encrypt data
     * @param plainText Text input to be encrypted
     * @return Returns encrypted text
     * 
     */
    public String encrypt(String secretKey, String plainText) 
            throws NoSuchAlgorithmException, 
            InvalidKeySpecException, 
            NoSuchPaddingException, 
            InvalidKeyException,
            InvalidAlgorithmParameterException, 
            UnsupportedEncodingException, 
            IllegalBlockSizeException, 
            BadPaddingException{
        //Key generation for enc and desc
        KeySpec keySpec = new PBEKeySpec(secretKey.toCharArray(), salt, iterationCount);
        SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);        
         // Prepare the parameter to the ciphers
        AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt, iterationCount);

        //Enc process
        ecipher = Cipher.getInstance(key.getAlgorithm());
        ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);      
        String charSet="UTF-8";       
        byte[] in = plainText.getBytes(charSet);
        byte[] out = ecipher.doFinal(in);
        String encStr=new sun.misc.BASE64Encoder().encode(out);
        return encStr;
    }
    
    public static void main(String[] args) throws Exception {

		CryptoUtilStandAlone cryptoUtil=new CryptoUtilStandAlone();
        String key=args[9];
        String data="";
        String enc="";
        if(args[0].equals("date"))
        {
        	data = args[1];
        	enc="software.installed.date="+cryptoUtil.encrypt(key, data);
        }
        System.out.println(enc);
        if(args[2].equals("days"))
        {
        	data = args[3];
        	enc="software.license.duration="+cryptoUtil.encrypt(key, data);
        }
        System.out.println(enc);
        if(args[4].equals("raisewarnings"))
        {
        	data = args[5];
        	enc="software.license.sub.warning="+cryptoUtil.encrypt(key, data);
        }
        System.out.println(enc);
        if(args[6].equals("maxsubscription"))
        {
        	data = args[7];
        	enc="software.license.sub.maximum="+cryptoUtil.encrypt(key, data);
        }
        System.out.println(enc);

        if(args[8].equals("key"))
        {
        	data = args[9];
        	enc="software.license.sub.key="+cryptoUtil.encrypt(key, data);
			WinRegistry.createKey(WinRegistry.HKEY_LOCAL_MACHINE, "SOFTWARE\\AGAPPS");
			WinRegistry.writeStringValue(WinRegistry.HKEY_LOCAL_MACHINE, "SOFTWARE\\AGAPPS","SUBKEY",cryptoUtil.encrypt(key, data));
        }

        System.out.println(enc);
        if(args[10].equals("data"))
        {
        	data = args[11];
        	enc="software.license.sub.data="+cryptoUtil.encrypt(key, data);
			WinRegistry.createKey(WinRegistry.HKEY_LOCAL_MACHINE, "SOFTWARE\\AGAPPS");
			WinRegistry.writeStringValue(WinRegistry.HKEY_LOCAL_MACHINE, "SOFTWARE\\AGAPPS","SUBDATA",cryptoUtil.encrypt(key, data));
        }

        System.out.println(enc);
    }
    
	public static final String getSerialNumber() {

		if (sn != null) {
			return sn;
		}

		OutputStream os = null;
		InputStream is = null;

		Runtime runtime = Runtime.getRuntime();
		Process process = null;
		try {
			process = runtime.exec(new String[] { "C:/windows/system32/Wbem/wmic", "bios", "get", "serialnumber" });
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		os = process.getOutputStream();
		is = process.getInputStream();

		try {
			os.close();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		Scanner sc = new Scanner(is);
		try {
			while (sc.hasNext()) {
				String next = sc.next();
				if ("SerialNumber".equals(next)) {
					sn = sc.next().trim();
					break;
				}
			}
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}

		if (sn == null) {
			throw new RuntimeException("Cannot find computer SN");
		}

		return sn;
	}
}