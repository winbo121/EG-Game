package com.game.join.service;

import com.game.join.vo.JoinVo;

public interface JoinService {

	public Integer joinIdCheck(JoinVo joinVo);
	
	public void joinInsert(JoinVo joinVo);
}
