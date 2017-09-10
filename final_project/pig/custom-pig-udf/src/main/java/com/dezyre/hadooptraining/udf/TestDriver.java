package com.dezyre.hadooptraining.udf;
import static java.nio.charset.StandardCharsets.*;

public class TestDriver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s  = "⭐⭐⭐⭐⭐ #SocialMedia #Marketing that concentrates on generating leads";
		
		

		System.out.println(s);
		System.out.println(samirSuggestion(s));
	}
	
	
	private static String samirSuggestion(String s){

		byte[] ptext = s.getBytes(ISO_8859_1); 
		String value = new String(ptext, UTF_8);
		
		return value;
	}

}
