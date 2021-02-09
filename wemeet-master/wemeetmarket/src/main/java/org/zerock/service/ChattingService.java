package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChatVO;
import org.zerock.domain.Criteria;

public interface ChattingService {
	
	public List<ChatVO> chattinglist();

	public void addchattingroom(ChatVO chat);
	
	public ChatVO selectChat(ChatVO chat);
	
	public boolean delete(Long cno);
	
	public void updatechat(ChatVO chat);
	
	
	public ChatVO create(ChatVO chat);




	

	
	
}
