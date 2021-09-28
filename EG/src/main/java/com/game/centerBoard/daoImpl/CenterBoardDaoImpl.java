package com.game.centerBoard.daoImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.centerBoard.dao.CenterBoardDao;
import com.game.centerBoard.vo.CenterBoardVo;


@Repository
public class CenterBoardDaoImpl implements CenterBoardDao{

	
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> centerBoardList(CenterBoardVo vo) {

		return sqlSession.selectList("centerBoard.list",vo);
	}

	@Override
	public void centerBoardInsert(CenterBoardVo vo) {

		sqlSession.insert("centerBoard.insert", vo);
	}

	@Override
	public CenterBoardVo centerBoardRead(Integer bno) {

		return sqlSession.selectOne("centerBoard.read", bno);
	}

	@Override
	public void centerBoardUpdate(CenterBoardVo vo) {

		sqlSession.update("centerBoard.update", vo);
	}

	@Override
	public void centerBoardDelete(Integer bno) {
		
		sqlSession.delete("centerBoard.delete", bno);
	}

	@Override
	public Integer centerBoardListCnt(CenterBoardVo vo) {
		
		return sqlSession.selectOne("centerBoard.listCnt", vo);
	}

	@Override
	public void centerBoardReadCnt(Integer bno) {
		sqlSession.update("centerBoard.readCnt", bno);
		
	}

	@Override
	public List<Map<String, Object>> centerBoardAnsweringList(CenterBoardVo vo) {
		return sqlSession.selectList("centerBoard.answering",vo);
	}

	@Override
	public List<Map<String, Object>> centerBoardAnswerList(CenterBoardVo vo) {
		return sqlSession.selectList("centerBoard.answer",vo);
	}

}
