package com.happy.board.test;

import org.apache.ibatis.session.SqlSessionFactory;

import com.happy.board.mybatis.SqlSessionFactoryManager;

public class Answerboard_Main {

	public static void main(String[] args) {
		SqlSessionFactoryManager.getSqlSessionFactory();

	}

}
