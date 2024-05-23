package com.game.utill.json;


import net.sf.json.JSONObject;

public class JsonUtill {
	
	
	JSONObject json =new JSONObject();
	
	public JSONObject jsonView(String data) {
		
		json.put("resultData", data);
		
		return json;
	}
	
}
