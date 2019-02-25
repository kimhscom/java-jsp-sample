package com.happy.board.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String path = "com/happy/board/mybatis/Configuration.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(path);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("sqlSessionFactory 생성");
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
