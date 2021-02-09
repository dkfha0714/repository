package org.zerock.service;
import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.SellboardVO;

public interface SellboardService {

	public boolean modify(SellboardVO sellboard);
	
	public List<SellboardVO> getlist(Criteria cri);
	
	public void insert(SellboardVO sellboard);
	
	public SellboardVO read(Long sno);
	
	public boolean delete(Long sno);
	
	public int update(SellboardVO sellboard);
	
	public int getTotal(Criteria cri);
	
	public List<SellboardVO> search(Criteria cri);
	
}
