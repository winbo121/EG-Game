package com.game.userBoard.daoImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.userBoard.dao.UserBoardDao;
import com.game.userBoard.vo.UserBoardVo;

@Repository
public class UserBoardDaoImpl implements UserBoardDao{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> userBoardList(UserBoardVo vo) {
		return sqlSession.selectList("userBoard.list",vo);
	}

	@Override
	public void userBoardInsert(UserBoardVo vo) {
		
		sqlSession.insert("userBoard.insert", vo);
	}

	@Override
	public UserBoardVo userBoardRead(Integer bno) {
		
		return sqlSession.selectOne("userBoard.read", bno);
	}

	@Override
	public void userBoardUpdate(UserBoardVo vo) {
	
		sqlSession.update("userBoard.update", vo);
	}

	@Override
	public void userBoardDelete(Integer bno) {
		
		sqlSession.delete("userBoard.delete", bno);
	}

	@Override
	public Integer userBoardListCnt(UserBoardVo vo) {
		
		return sqlSession.selectOne("userBoard.listCnt", vo);
	}

	@Override
	public void userBoardReadCnt(Integer bno) {
		sqlSession.update("userBoard.readCnt", bno);
	}

}
