package com.dezyre.hadooptraining.udf;

import java.io.IOException;
import java.nio.charset.Charset;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class Utf8StringEncoder extends EvalFunc<String> {

	private static final Charset charset = Charset.forName("UTF8");

	public Utf8StringEncoder() {
	}

	@Override
	public String exec(Tuple tuple) throws IOException {
		Object obj = tuple.get(0);

		if (obj == null) {
			return "";
		}
		return charset.decode(charset.encode(obj.toString())).toString();
	}

}
