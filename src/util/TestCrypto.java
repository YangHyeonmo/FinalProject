package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

class TransferInfoSub1Security extends Thread{
	public void run() {
		System.out.println("***BlockChain 시작***");
			try {
				String main="";
				String line = "";
				
				BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
				BufferedWriter sub1 = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSub1.txt"));
				while ((line = br.readLine()) != null) {
					main += line+"\n";
				}
		
				sub1.write(main+"\n");
				sub1.flush();
				sub1.close();
				
				}
			catch (Exception e) {
		     }
	        System.out.println("==================================");
			System.out.println("***TransferInfoSub1***파일저장 완료***BlockChain***");
	        System.out.println("==================================");

		}
}
class TransferInfoSub2Security extends Thread{
	public void run() {
			try {
				String main="";
				String line = "";
				
				BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
				BufferedWriter sub2 = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSub2.txt"));
				while ((line = br.readLine()) != null) {
					main += line+"\n";
				}
				sub2.write(main+"\n");
				sub2.flush();
				sub2.close();
				}
			
			catch (Exception e) {
		     }
			System.out.println("***TransferInfoSub2***파일저장 완료***BlockChain***");
	        System.out.println("==================================");

		}
	}
class TransferInfoSub3Security extends Thread{
	public void run() {
			try {
				String main="";
				String line = "";
				BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
				BufferedWriter sub3 = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSub3.txt"));
	
				while ((line = br.readLine()) != null) {
					main += line+"\n";
				}
				sub3.write(main+"\n");
				sub3.flush();
				sub3.close();
			}
			catch (Exception e) {
		     }
			System.out.println("***TransferInfoSub3***파일저장 완료***BlockChain***");		
	        System.out.println("==================================");

			}
	}



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
	      System.out.println("==================================");
	      System.out.println("BlockChain True일 확률 : " + compare +"%");
	      System.out.println("==================================");
	    
       if(compare > 51) {
    	   TransferInfoSub1Security sub1Security = new TransferInfoSub1Security();
    	   TransferInfoSub2Security sub2Security = new TransferInfoSub2Security();
    	   TransferInfoSub3Security sub3Security = new TransferInfoSub3Security();
    	   Thread.sleep(10 * 1000);
    	   sub1Security.start();
    	   Thread.sleep(10 * 1000);
    	   sub2Security.start();
    	   Thread.sleep(10 * 1000);
    	   sub3Security.start();

       }
        
        
    }
}




