package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.SellboardVO;
public interface SellBoardMapper {

	public List<SellboardVO> getlist();
	
	public void insert(SellboardVO sellboard);
	
	public SellboardVO read(Long sno);
	
	public int delete(Long sno);
	
	public int update(SellboardVO sellboard);
	
	public List<SellboardVO> search(Criteria cri);
	
	public int getTotalConut(Criteria cri);
	
	public List<SellboardVO> getListWithPaging(Criteria cri);
}
