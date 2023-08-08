package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;
import kr.spring.ticket.vo.SeatVO;

public interface TicketService { 
	/* 좌석등급 */
	// 등록
	public void insertGrade(GradeVO gradeVO);
	// 목록
	public int selectGradeCount(GradeVO gradeVO);
	public List<GradeVO> selectGradeList(GradeVO gradeVO);
	// 상세
	public GradeVO selectGrade(Integer grade_num);
	// 수정
	public void updateGrade(GradeVO gradeVO);
	//삭제
	public void deleteGrade(Integer grade_num);
	// 등급별 총 좌석개수
	public void updateGradeQuantity(Integer grade_num);
	
	/* 좌석정보 */
	// 등록
	public void insertSeat(SeatVO seatVO);
	// 목록
	public int selectSeatCount(SeatVO seatVO);
	public List<SeatVO> selectSeatList(SeatVO seatVO);
	// 상세
	public SeatVO selectSeat(Integer grade_num);
	// 수정
	public void updateSeat(SeatVO seatVO);
	// 등급별 좌석개수
	public Integer selectSeatQuantity(Integer grade_num);
	
	
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
