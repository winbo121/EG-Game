package com.game.json.utill;


import net.sf.json.JSONObject;

public class JsonUtill {
	
	
	JSONObject json =new JSONObject();
	
	public JSONObject jsonView(String data) {
		
		json.put("resultData", data);
		
		
		return json;
	}
	
}
