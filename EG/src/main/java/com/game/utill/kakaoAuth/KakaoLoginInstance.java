package com.game.utill.kakaoAuth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoLoginInstance extends DefaultApi20{

	   protected KakaoLoginInstance(){
	    }
	 
	    private static class InstanceHolder{
	        private static final KakaoLoginInstance INSTANCE = new KakaoLoginInstance();
	    }
	 
	 
	    public static KakaoLoginInstance instance(){
	        return InstanceHolder.INSTANCE;
	    }
	 
	    @Override
	    public String getAccessTokenEndpoint() {
	        return "https://kauth.kakao.com/oauth/token?grant_type=authorization_code&client_id=";
	    }                   
	 
	    @Override
	    protected String getAuthorizationBaseUrl() {
	        return "https://kauth.kakao.com/oauth/authorize";
	    }  

}
