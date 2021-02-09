package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BuyboardVO;
import org.zerock.domain.Criteria;

public interface BuyBoardMapper {

	public List<BuyboardVO> getlist();
	
	public void insert(BuyboardVO buyboard);
	
	public BuyboardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BuyboardVO buyboard);
	
	public List<BuyboardVO> search(Criteria cri);
	
	public int getTotalConut(Criteria cri);
	
	public List<BuyboardVO> getListWithPaging(Criteria cri);
}
