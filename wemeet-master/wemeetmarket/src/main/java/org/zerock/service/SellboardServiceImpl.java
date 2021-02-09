package org.zerock.service;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.SellboardVO;
import org.zerock.mapper.SellBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class SellboardServiceImpl implements SellboardService {

	private SellBoardMapper mapper;
	
	

	public List<SellboardVO> getlist(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}
	@Transactional
	public void insert(SellboardVO sellboard) {
		
		mapper.insert(sellboard);
	}

	
	public SellboardVO read(Long sno) {
		
		return mapper.read(sno);
	}
	@Transactional
	public boolean delete(Long sno) {
		
		return mapper.delete(sno)==1;
	}
	@Transactional
	public int update(SellboardVO sellboard) {
		
		return mapper.update(sellboard);
	}

	@Override
	public List<SellboardVO> search(Criteria cri) {
		
		return mapper.search(cri);
	}
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalConut(cri);
	}
	@Override
	public boolean modify(SellboardVO sellboard) {
		
		return mapper.update(sellboard)==1;
	}
}
