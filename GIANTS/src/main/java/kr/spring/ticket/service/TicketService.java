package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.ticket.vo.GameVO;

public interface TicketService {
	/* 경기정보 */
	// 등록
	public void insertGame(GameVO gameVO);
	// 목록
	public int selectRowCount(GameVO gameVO);
	public List<GameVO> selectTicketGameList(GameVO gameVO);
	// 경기정보를 이용해 경기정보 구하기
	public GameVO selectGame(Integer game_num);
	// 수정
	public void updateGame(GameVO gameVO);
}
