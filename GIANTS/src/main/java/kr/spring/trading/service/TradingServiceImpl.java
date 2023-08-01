package kr.spring.trading.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.trading.dao.TradingMapper;
import kr.spring.trading.vo.TradingVO;

@Service
@Transactional
public class TradingServiceImpl implements TradingService{
	
	@Autowired
	TradingMapper tradingMapper;
	
	@Override
	public List<TradingVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertBoard(TradingVO trading) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TradingVO selectBoard(Integer trade_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(Integer trade_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStatus(Integer trade_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTrading(TradingVO trading) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTrading(Integer trade_num) {
		// TODO Auto-generated method stub
		
	}
	
}
