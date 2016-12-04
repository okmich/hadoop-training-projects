package com.dezyre.hadooptraining.udf;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class HrefExtractor extends EvalFunc<String> {

	public HrefExtractor() {

	}

	@Override
	public String exec(Tuple tuple) throws IOException {
		Object obj = tuple.get(0);

		if (obj == null) {
			return "";
		}
		String anchorTag = obj.toString();
		String[] parts = anchorTag.replace("\"", "").split("\\s");
		String href = null;
		for (String part : parts) {
			if (part.startsWith("href=") || part.startsWith("http://") || part.startsWith("https://")) {
				href = part.replace("href=", "");
				break;
			}
		}

		return href;
	}

}
