package com.dezyre.hadooptraining.udf;

import java.io.IOException;

import static java.nio.charset.StandardCharsets.*;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class Utf8StringEncoder extends EvalFunc<String> {


	public Utf8StringEncoder() {
	}

	@Override
	public String exec(Tuple tuple) throws IOException {
		Object obj = tuple.get(0);

		if (obj == null) {
			return "";
		}
		//Thanks to Samir Desai
		byte[] ptext = obj.toString().getBytes(ISO_8859_1); 
		String value = new String(ptext, UTF_8);
		
		return value;
	}

}
