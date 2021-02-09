package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChatVO;

public interface ChatMapper {
	 
	        
	public List<ChatVO> getlist();
	
	public ChatVO create(ChatVO chat);
	
	public void insert(ChatVO chat);
	
	public ChatVO get(ChatVO chat);
	
	public void update(ChatVO chat);

	
	public int delete(Long cno);
}