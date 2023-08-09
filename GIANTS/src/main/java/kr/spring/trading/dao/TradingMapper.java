package kr.spring.trading.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.trading.vo.TradingMarkVO;
import kr.spring.trading.vo.TradingVO;

@Mapper //mybatis가 객체 생성할 수 있게끔 함
public interface TradingMapper {
	//부모글
	public List<TradingVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertTrading(TradingVO trading);
	public TradingVO selectTrading(Integer trade_num);
	@Update("UPDATE trading SET trade_hit=trade_hit+1 WHERE trade_num=#{trade_num}")
	public void updateHit(Integer trade_num);
	public void updateStatus(Integer trade_num);
	@Update("UPDATE trading SET trade_title=#{trade_title}, trade_content=#{trade_content}, trade_price=#{trade_price}, trade_photo=#{trade_photo}, trade_photoname=#{trade_photoname}, trade_ip=#{trade_ip}, trade_status=#{trade_status}, trade_modifydate=SYSDATE WHERE trade_num=#{trade_num}")
	public void updateTrading(TradingVO trading);
	@Delete("DELETE FROM trading WHERE trade_num=#{trade_num}")
	public void deleteTrading(Integer trade_num);
	
	//북마크
	@Select("SELECT * FROM bookmark WHERE trade_num=#{trade_num} AND mem_num=#{mem_num}")
	public TradingMarkVO selectMark(TradingMarkVO mark);
	@Select("SELECT COUNT(*) FROM bookmark WHERE trade_num=#{trade_num}")
	public int selectMarkCount(Integer trade_num);
	@Insert("INSERT INTO bookmark (mark_num, trade_num, mem_num) VALUES (bookmark_seq.nextval, #{trade_num}, #{mem_num})")
	public void insertMark(TradingMarkVO fav);
	@Delete("DELETE FROM bookmark WHERE mark_num=#{mark_num}")
	public void deleteMark(Integer mark_num);
	public void deleteMarkByTradeNum(Integer trade_num);
} 
