package com.game.join.dao;

import com.game.join.vo.JoinVo;

public interface JoinDao {
	
	public Integer joinIdCheck(JoinVo joinVo);
	
	public void joinInsert(JoinVo joinVo);

}
