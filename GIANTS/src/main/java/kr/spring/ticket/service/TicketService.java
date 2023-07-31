package kr.spring.ticket.service;

import kr.spring.ticket.vo.TicketGameVO;

public interface TicketService {
	/* 경기정보 */
	// 등록
	public void insertGame(TicketGameVO ticketGameVO);
}
