package com.dezyre.hadooptraining.udf;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.DataBag;
import org.apache.pig.data.Tuple;

public class HashTextExtractor extends EvalFunc<String> {

	public HashTextExtractor() {

	}

	@Override
	public String exec(Tuple tuple) throws IOException {
		Object obj = tuple.get(0);

		if (obj == null) {
			return "";
		}
		DataBag dataBag = (DataBag) obj;
		Iterator<Tuple> it = dataBag.iterator();
		StringBuilder hashTags = new StringBuilder("");
		while (it.hasNext()) {
			hashTags.append(",#" + ((Map) it.next().get(0)).get("text"));
		}
		return hashTags.length() > 0 ? hashTags.substring(1).toString() : "";
	}

}
