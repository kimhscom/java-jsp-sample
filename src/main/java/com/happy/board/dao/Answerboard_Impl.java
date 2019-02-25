package com.happy.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.happy.board.dto.AnswerBoardDTO;
import com.happy.board.mybatis.SqlSessionFactoryManager;

public class Answerboard_Impl implements IAnswerBoardDao {
	
	private SqlSessionFactory session
				= SqlSessionFactoryManager.getSqlSessionFactory();
	private final Logger log = Logger.getLogger(Answerboard_Impl.class);
	private final String NS = "happy.answerboard.";

	@Override
	public List<AnswerBoardDTO> selectAllBoard() {
		log.info("selectAllBoard");
		List<AnswerBoardDTO> lists = null;
		SqlSession manager = session.openSession(true);
		lists = manager.selectList(NS+"selectAllBoard");
		manager.close();
		return lists;
	}

	@Override
	public AnswerBoardDTO selectDetailBoard(String seq) {
		log.info("selectDetailBoard");
		AnswerBoardDTO dto = null;
		SqlSession manager = session.openSession(true);
		dto = manager.selectOne(NS+"selectDetailBoard", seq);
		manager.close();
		return dto;
	}

	@Override
	public boolean reply(AnswerBoardDTO dto) {
		log.info("reply");
		boolean isc = false;
		SqlSession manager = session.openSession(false);
		int u = manager.update(NS+"replyUpdate", dto);
		int i = manager.insert(NS+"replyInsert", dto);
		manager.commit();
		manager.close();
		return ((u+i)>0)?true:false;
	}

	@Override
	public boolean modifyBoard(AnswerBoardDTO dto) {
		log.info("modifyBoard");
		boolean isc = false;
		SqlSession manager = session.openSession(true);
		int m = manager.update(NS+"modifyBoard", dto);
		manager.close();
		return m>0?true:false;
	}

	@Override
	public boolean deleteBoard(String seq) {
		log.info("deleteBoard");
		boolean isc = false;
		SqlSession manager = session.openSession(true);
		int d = manager.update(NS+"deleteBoard", seq);
		manager.close();
		return d>0?true:false;
	}

	@Override
	public boolean insertBoard(AnswerBoardDTO dto) {
		log.info("insertBoard");
		boolean isc = false;
		SqlSession manager = session.openSession(true);
		int i = manager.insert(NS+"insertBoard", dto);
		manager.close();
		return i>0?true:false;
	}

	@Override
	public boolean readCount(String seq) {
		log.info("readCount");
		boolean isc = false;
		SqlSession manager = session.openSession(true);
		int c = manager.update(NS+"readCount", seq);
		manager.close();
		return c>0?true:false;
	}

	@Override
	public boolean deleteBoardReal(String seq) {
		log.info("deleteBoardReal");
		boolean isc = false;
		SqlSession manager = session.openSession(true);
		int d = manager.delete(NS+"deleteBoardReal", seq);
		manager.close();
		return d>0?true:false;
	}

	@Override
	public boolean multiDelete(String[] seqs) {
		log.info("multiDelete");
		boolean isc = false;
		SqlSession manager = session.openSession(false);
		int cnt = 0;
		for (int i = 0; i < seqs.length; i++) {
			cnt += manager.update(NS+"multiDelete", seqs[i]);
		}
		manager.commit();
		manager.close();
		return cnt>0?true:false;
	}

}
