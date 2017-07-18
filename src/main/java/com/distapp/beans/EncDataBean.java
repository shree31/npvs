package com.distapp.beans;
import java.security.*;
import java.security.cert.*;
import java.security.spec.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.io.*;
import java.util.Enumeration;
import java.util.*;


public class EncDataBean {

	public void encDataBean(Object UserId,Object UserKey,String file_path)
	{  	  

       try
       { 		 
		   //System.out.println("Encryption.............");
		   String l_str_type=UserId.toString();
		   String keyalias= "Bagee";
		   String file = file_path+"/"+l_str_type+".txt";
		   String keypass = "HBS";
		   String PBPass= UserKey.toString();
		   String P_ALGORITHM = "PBEWithMD5AndDES";

		   File f = new File(file);
		   if(f.exists())
			f.delete();		   
		   if(f.createNewFile()==true)
		   {

         PBEKeySpec pbekeyspec = new  PBEKeySpec(PBPass.toCharArray(),"PBSS".getBytes(),20,128);
         SecretKey skey =   SecretKeyFactory.getInstance(P_ALGORITHM).generateSecret(pbekeyspec);
         //SecretKeySpec skey1 = new SecretKeySpec(skey.getEncoded(),"JCEKS");
         SecretKeySpec skey1 = new SecretKeySpec(skey.getEncoded(),"SWAMY");
         KeyStore keystore = KeyStore.getInstance("JCEKS");
         InputStream in = new FileInputStream(file);
         char[] passwd = keypass.toCharArray();
         //keystore.load(in, passwd);
		 keystore.load(null, passwd);
         //System.out.println("loaded Encription for.."+l_str_type);
         in.close();
		 
         keystore.setKeyEntry(keyalias,skey1,keypass.toCharArray(),null);
         FileOutputStream fos = new FileOutputStream(file);
         keystore.store(fos,passwd);
         fos.flush();
         fos.close();
		   }
	   }catch(Exception e)
		{
		   e.printStackTrace();
	    }

		return;
	}

}