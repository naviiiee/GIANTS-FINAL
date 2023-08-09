package kr.spring.trading.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.trading.dao.TradingMapper;
import kr.spring.trading.vo.TradingMarkVO;
import kr.spring.trading.vo.TradingVO;

@Service
@Transactional
public class TradingServiceImpl implements TradingService{
	
	@Autowired
	TradingMapper tradingMapper;
	
	@Override
	public List<TradingVO> selectList(Map<String, Object> map) {
		return tradingMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return tradingMapper.selectRowCount(map);
	}

	@Override
	public void insertTrading(TradingVO trading) {
		tradingMapper.insertTrading(trading);
	}

	@Override
	public TradingVO selectTrading(Integer trade_num) {
		return tradingMapper.selectTrading(trade_num);
	}

	@Override
	public void updateHit(Integer trade_num) {
		tradingMapper.updateHit(trade_num);
	}

	@Override
	public void updateStatus(Integer trade_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTrading(TradingVO trading) {
		tradingMapper.updateTrading(trading);
	}

	@Override
	public void deleteTrading(Integer trade_num) {
		tradingMapper.deleteTrading(trade_num);
	}

	@Override
	public TradingMarkVO selectMark(TradingMarkVO mark) {
		return tradingMapper.selectMark(mark);
	}

	@Override
	public int selectMarkCount(Integer trade_num) {
		return tradingMapper.selectMarkCount(trade_num);
	}

	@Override
	public void insertMark(TradingMarkVO mark) {
		tradingMapper.insertMark(mark);
	}

	@Override
	public void deleteMark(Integer mark_num) {
		tradingMapper.deleteMark(mark_num);
	}
	
} 
