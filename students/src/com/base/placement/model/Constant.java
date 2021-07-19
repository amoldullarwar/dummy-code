package com.base.placement.model;

import java.util.Arrays;
import java.util.List;
public class Constant {
	private static final List<String> HSCTypes = Arrays.asList("ART","COM","SCI","VOC") ;
	private static final List<String> GRADTypes = Arrays.asList("BA","BCOM","BSC","BBA","BCA");

	public static List<String> getGRADTypes() {
		return GRADTypes;
	}
	public static List<String> getHSCTypes() {
		return HSCTypes;
	}
}
