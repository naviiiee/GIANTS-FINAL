package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import kr.spring.ticket.vo.GameVO;

public interface TicketService {
	/* 경기정보 */
	// 등록
	public void insertGame(GameVO gameVO);
	// 목록
	public int selectRowCount(GameVO gameVO);
	public List<GameVO> selectTicketGameList(GameVO gameVO);
}
