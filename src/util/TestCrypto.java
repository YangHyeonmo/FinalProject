package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class TestCrypto {
	public static void main(String[] args) throws Exception {

        String plainText = "최규성이 현모한테 100만원을 보냈습니다";
        String key = "secret key";
        String encrypted = CryptoUtil.encryptAES256(plainText, key);
        System.out.println("AES-256 : enc - " + encrypted);
        System.out.println("AES-256 : dec - " + CryptoUtil.decryptAES256(encrypted, key));
        
        
        BufferedWriter bw = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt",true));
        
        bw.write(encrypted+"\n");
        bw.flush();
        bw.close();
        
        System.out.println("==================================");
        System.out.println("완료");
       
        String main="";
        String sub1="";
        String sub2="";
        String sub3="";
        double compare=100/3;

       	BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
    	BufferedReader br1 = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSub1.txt"));
    	BufferedReader br2 = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSub2.txt"));
    	BufferedReader br3 = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSub3.txt"));
		

	      try {
		     String  line="";
	            while ((line = br.readLine()) != null) {
	            	main+=line;
	            }
	      } catch (Exception e) {
	      }
	      
	      try {
		     String  line="";
	            while ((line = br1.readLine()) != null) {
	            	sub1+=line;
	            }
	      } catch (Exception e) {
	      }
	      try {
		     String  line="";
	            while ((line = br2.readLine()) != null) {
	            	sub2+=line;
	            }
	      } catch (Exception e) {
	      }
	      try {
			  String  line="";
		         while ((line = br3.readLine()) != null) {
		            sub3+=line;
		           }
		      } catch (Exception e) {
		      }
	      
	      
	      if(sub1.hashCode() == sub2.hashCode()) {
	    	  compare += 100/3;
	    	  if(sub2.hashCode() == sub3.hashCode()) {
		    	  compare += 100/3;
	    	  }
	      }
	      else if (sub2.hashCode() == sub3.hashCode()) {
	    	  compare += 100/3;
	      }
	      else if(sub1.hashCode() == sub3.hashCode()) {
    		  compare += 100/3;
    		 
    	  }
	      
	      System.out.println(compare);
	      
		     
	      
       
        
        
    }
}




