package kr.spring.trading.service;

import java.util.List;
import java.util.Map;

import kr.spring.trading.vo.TradingVO;

public interface TradingService {
	//부모글
	public List<TradingVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertTrading(TradingVO trading);
	public TradingVO selectTrading(Integer trade_num);
	public void updateHit(Integer trade_num);
	public void updateStatus(Integer trade_num);
	public void updateTrading(TradingVO trading);
	public void deleteTrading(Integer trade_num);
}