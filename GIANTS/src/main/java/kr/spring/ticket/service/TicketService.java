package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import kr.spring.ticket.vo.TicketGameVO;

public interface TicketService {
	/* 경기정보 */
	// 등록
	public void insertGame(TicketGameVO ticketGameVO);
	// 목록
	public int selectRowCount(TicketGameVO ticketGameVO);
	public List<TicketGameVO> selectTicketGameList(TicketGameVO ticketGameVO);
}
