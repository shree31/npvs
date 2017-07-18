package com.distapp.beans;
import java.io.*;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.util.*;

public class DecDataBean
{
		public static String getEncValue(String l_str_type,String file_path) 
		{
			//System.out.println("Entered Decryption.................");
			String l_key_val = null;
			try
			{
		   String keyalias= "Bagee";
		   String file = file_path;
		   String keypass = "HBS";
		   String P_ALGORITHM = "PBEWithMD5AndDES";
			KeyStore ks = KeyStore.getInstance("JCEKS");
			char[] pass1 = keypass.toCharArray();
				ks.load(new FileInputStream(file_path), pass1);

				if (ks.isKeyEntry(keyalias)) 
				{
					//get the key
					char c[] = new char[keypass.length()];
					keypass.getChars(0, c.length, c, 0);

					Key k =  ks.getKey(keyalias, c);

					// print the algorithm
					//System.out.println("Receiving Valid "+l_str_type);
					l_key_val = new String(k.getEncoded());
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}

			return l_key_val;
		}
}
