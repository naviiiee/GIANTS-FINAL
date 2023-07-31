package kr.spring.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.ticket.vo.GameVO;

@Mapper
public interface TicketMapper {
	/* 경기정보 */
	// 등록
	public void insertGame(GameVO gameVO);
	// 목록
	@Select("SELECT COUNT(*) FROM tgame")
	public int selectRowCount(GameVO gameVO);
	@Select("SELECT * FROM tgame ORDER BY game_date ASC")
	public List<GameVO> selectTicketGameList(GameVO gameVO);
	// 수정
	public void updateGame(GameVO gameVO);
	// 삭제
	public void deleteGame(Integer game_num);
	
	/* 좌석등급 */
	// 등록
	public void insertGrade();
	// 수정
	// 삭제
}
