package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ChatVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.ChatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class ChattingServiceImpl implements ChattingService{

	private	ChatMapper mapper;
	


	public void addchattingroom(ChatVO chat) {
	
		mapper.insert(chat);
	}

	@Transactional
	public boolean delete(Long cno) {
		
		return mapper.delete(cno)==1;
	}


	public void updatechat(ChatVO chat) {
	
		mapper.update(chat);
	}


	public List<ChatVO> chattinglist() {

		return mapper.getlist();
	}


	public ChatVO selectChat(ChatVO chat) {
		return mapper.get(chat);
	}

	public ChatVO create(ChatVO chat) {
		return mapper.create(chat);
	}


	
}
