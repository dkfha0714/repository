package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	
	private MemberMapper mapper;

	@Override
	public List<MemberVO> getList() {
		
		
		return mapper.getList();
		
		
	}

	@Override
	@Transactional
	public void insert(MemberVO member) {

		mapper.insert(member);

	}

	public MemberVO login(MemberVO member) {

		return mapper.login(member);
		
	}
	
	@Transactional
	public void delete(Long mno) {

		mapper.delete(mno);
		
	}

	@Transactional
	public int update(MemberVO member) {
		
		return mapper.update(member);
		
	}
    
	public MemberVO select(Long mno) {
		
		return mapper.select(mno);
	}
	
	public void agree(MemberVO member) {
		mapper.agree(member);
	}
	
	public MemberVO result(MemberVO member) {
		return mapper.result(member);
	}
	
	
	public MemberVO emailcheck(MemberVO member) {
		
		return mapper.emailcheck(member);
		
	}
	
	public List<MemberVO> getlist(){
		
		return mapper.getlist();
	}
	
	public MemberVO read(Long adno) {
		
		return mapper.read(adno);
	}
	@Transactional
	public boolean acdelete(Long adno) {
		
		return mapper.acdelete(adno) == 1;
	}
	
	public List<Map<String, String>> select2(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}
	
	public MemberVO acinfoDetail(Long adno) {
		
		return mapper.acinfoDetail(adno);
	}
	
	public void leave(Long mno) {
		
		mapper.leave(mno);
	}
	
	public int getTotal(Criteria cri){
		
		return mapper.getTotalCount(cri);
	}
	
}

