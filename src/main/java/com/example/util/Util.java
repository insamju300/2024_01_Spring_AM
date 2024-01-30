package com.example.util;

public class Util {
	public static boolean isNullOrEmpty(String parameter) {
		if (parameter == null || parameter.trim().length() == 0) {
			return true;
		}
		return false;
	}
}
