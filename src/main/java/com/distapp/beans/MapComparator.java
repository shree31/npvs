package com.distapp.beans;

import java.util.Comparator;
import java.util.Map;

public class MapComparator implements Comparator {

	Map<String, Integer> compareMap;

	public MapComparator(Map<String, Integer> compareMap){
		this.compareMap = compareMap;
	}

	
	public int compare(Object val1, Object val2) {
		if(((Integer) compareMap.get(val1)).compareTo(compareMap.get(val2)) == 0)
			return 1;
		 return ((Integer) compareMap.get(val2)).compareTo(compareMap.get(val1));

	}
}