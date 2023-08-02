package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;

public interface TicketService {
	/* 좌석등급 */
	// 등록
	public void insertGrade(GradeVO gradeVO);
	// 목록
	public int selectGradeCount(GradeVO gradeVO);
	public List<GradeVO> selectGradeList(GradeVO gradeVO);
	// 상세
	public GradeVO selectGrade(Integer grade_num);
	
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
