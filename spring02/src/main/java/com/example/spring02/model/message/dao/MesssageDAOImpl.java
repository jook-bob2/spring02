package com.example.spring02.model.message.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.message.dto.MessageDTO;

@Repository // dao 빈으로 등록
public class MesssageDAOImpl implements MessageDAO {

	@Inject // 의존관계 주입(Dependency Injection, DI)
	SqlSession sqlSession;
	
	@Override
	public void create(MessageDTO dto) {
		sqlSession.insert("message.create", dto);
	}

	@Override
	public MessageDTO readMessage(int mid) {
		return null;
	}

	@Override
	public void updateState(int mid) {

	}

}
