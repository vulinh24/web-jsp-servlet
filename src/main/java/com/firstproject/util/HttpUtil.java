package com.firstproject.util;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {

	private String value;

	public HttpUtil() {
	}

	public HttpUtil(String value) {
		this.value = value;
	}

	public <T> T toModel(Class<T> clazz) {
		try {
			return new ObjectMapper().readValue(value, clazz);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static HttpUtil of (BufferedReader reader) {
		StringBuilder sb = new StringBuilder();
		String line = "";
		try {
			while ( (line = reader.readLine()) != null) {
				sb.append(line);
			}
			return new HttpUtil(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}
