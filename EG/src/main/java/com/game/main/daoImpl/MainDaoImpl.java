package com.game.main.daoImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.main.dao.MainDao;
import com.game.main.vo.MainVo;

@Repository
public class MainDaoImpl implements MainDao{

	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> mainAdminBoardList() {
		
		return sqlSession.selectList("main.mainAdminBoardList");
	}

	@Override
	public List<Map<String, Object>> mainCenterBoardList() {
		
		return sqlSession.selectList("main.mainCenterBoardList");
	}

	@Override
	public List<Map<String, Object>> mainUserBoardList() {
		
		return sqlSession.selectList("main.mainUserBoardList");
	}

	@Override
	public List<Map<String, Object>> mainCodeList(String code_cd_id) {
		
		return sqlSession.selectList("main.mainCodeList",code_cd_id);
	}



}
