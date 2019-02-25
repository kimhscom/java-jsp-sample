package com.happy.board.dao;

import java.util.List;

import com.happy.board.dto.AnswerBoardDTO;

public interface IAnswerBoardDao {
	
	public List<AnswerBoardDTO> selectAllBoard();
	public AnswerBoardDTO selectDetailBoard(String seq);
	
	public boolean reply(AnswerBoardDTO dto);
		
	public boolean modifyBoard(AnswerBoardDTO dto);
	public boolean deleteBoard(String seq);
	public boolean insertBoard(AnswerBoardDTO dto);
	public boolean readCount(String seq);
	public boolean deleteBoardReal(String seq);
	public boolean multiDelete(String[] seqs);	

}
