package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	

	public List<MemberVO> getList();
	
	@Transactional
	public void insert(MemberVO member);
	
	public MemberVO login(MemberVO member);
	
	@Transactional
	public int delete(Long mno);
	
	@Transactional
	public int update(MemberVO member);
	
	@Transactional
	public MemberVO select(Long mno);
	
	public int agree(MemberVO member);
	
	public MemberVO result(MemberVO member);

	public MemberVO emailcheck(MemberVO member);
	
	public List<MemberVO> getlist();

	public MemberVO read(Long adno);
	
	public int acdelete(Long adno);
	
	public List<Map<String, String>> getListWithPaging(Criteria cri);

	public MemberVO acinfoDetail(Long adno);
	
	@Transactional
	public void leave(Long mno);

	public Integer getTotalCount(Criteria cri);


	
}
