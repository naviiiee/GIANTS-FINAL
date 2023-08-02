package kr.spring.trading.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.spring.trading.vo.TradingVO;

@Mapper //mybatis가 객체 생성할 수 있게끔 함
public interface TradingMapper {
	//부모글
	public List<TradingVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertTrading(TradingVO trading);
	public TradingVO selectTrading(Integer trade_num);
	@Update("UPDATE trading SET hit=hit+1 WHERE trade_num=#{trade_num}")
	public void updateHit(Integer trade_num);
	public void updateStatus(Integer trade_num);
	public void updateTrading(TradingVO trading);
	public void deleteTrading(Integer trade_num);
} 
