package org.zerock.service;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BuyboardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BuyBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Service
@AllArgsConstructor
public class BuyboardServiceImpl implements BuyboardService {

	private BuyBoardMapper mapper;
	
	

	public List<BuyboardVO> getlist(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}
	@Transactional
	public void insert(BuyboardVO buyboard) {
		
		mapper.insert(buyboard);
	}

	
	public BuyboardVO read(Long bno) {
		
		return mapper.read(bno);
	}
	@Transactional
	public boolean delete(Long bno) {
		
		return mapper.delete(bno)==1;
	}
	@Transactional
	public int update(BuyboardVO buyboard) {
		
		return mapper.update(buyboard);
	}

	@Override
	public List<BuyboardVO> search(Criteria cri) {
		
		return mapper.search(cri);
	}
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalConut(cri);
	}
	@Override
	public boolean modify(BuyboardVO buyboard) {
		
		return mapper.update(buyboard)==1;
	}
}
