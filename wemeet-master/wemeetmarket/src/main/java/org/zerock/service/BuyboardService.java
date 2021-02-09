package org.zerock.service;
import java.util.List;

import org.zerock.domain.BuyboardVO;
import org.zerock.domain.Criteria;



public interface BuyboardService {

	public boolean modify(BuyboardVO buyboard);
	
	public List<BuyboardVO> getlist(Criteria cri);
	
	public void insert(BuyboardVO buyboard);
	
	public BuyboardVO read(Long bno);
	
	public boolean delete(Long bno);
	
	public int update(BuyboardVO buyboard);
	
	public int getTotal(Criteria cri);
	
	public List<BuyboardVO> search(Criteria cri);
	
}
