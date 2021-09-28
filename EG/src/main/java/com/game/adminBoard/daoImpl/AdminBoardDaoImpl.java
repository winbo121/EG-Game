package com.game.adminBoard.daoImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.adminBoard.dao.AdminBoardDao;
import com.game.adminBoard.vo.AdminBoardVo;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> adminBoardList(AdminBoardVo vo) {

		return sqlSession.selectList("adminBoard.list",vo);
	}

	@Override
	public void adminBoardInsert(AdminBoardVo vo) {

		sqlSession.insert("adminBoard.insert", vo);
	}

	@Override
	public AdminBoardVo adminBoardRead(Integer bno) {

		return sqlSession.selectOne("adminBoard.read", bno);
	}

	@Override
	public void adminBoardUpdate(AdminBoardVo vo) {

		sqlSession.update("adminBoard.update", vo);
	}

	@Override
	public void adminBoardDelete(Integer bno) {

		sqlSession.delete("adminBoard.delete", bno);
	}

	@Override
	public Integer adminBoardListCnt(AdminBoardVo vo) {

		return sqlSession.selectOne("adminBoard.listCnt", vo);
	}

	@Override
	public void adminBoardReadCnt(Integer bno) {

		sqlSession.update("adminBoard.readCnt", bno);
	}

}
