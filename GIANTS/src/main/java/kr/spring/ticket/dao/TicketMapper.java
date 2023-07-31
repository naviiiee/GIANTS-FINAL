package kr.spring.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.ticket.vo.TicketGameVO;

@Mapper
public interface TicketMapper {
	/* 경기정보 */
	// 등록
	public void insertGame(TicketGameVO ticketGameVO);
	// 목록
	@Select("SELECT COUNT(*) FROM tgame")
	public int selectRowCount(TicketGameVO ticketGameVO);
	@Select("SELECT * FROM tgame ORDER BY game_date ASC")
	public List<TicketGameVO> selectTicketGameList(TicketGameVO ticketGameVO);
	// 수정
}
