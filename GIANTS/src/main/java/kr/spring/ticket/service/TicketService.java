package kr.spring.ticket.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberDetailVO;
import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;
import kr.spring.ticket.vo.SeatStatusVO;
import kr.spring.ticket.vo.SeatVO;
import kr.spring.ticket.vo.TicketCheckVO;
import kr.spring.ticket.vo.TicketVO;

public interface TicketService { 
	/* 좌석등급 */
	public void insertGrade(GradeVO gradeVO);	// 등록
	public int selectGradeCount(GradeVO gradeVO);
	public List<GradeVO> selectGradeList(GradeVO gradeVO);
	public GradeVO selectGrade(Integer grade_num);	// 상세
	public void updateGrade(GradeVO gradeVO);	// 수정
	public void deleteGrade(Integer grade_num);	// 삭제
	public void updateGradeQuantity(Integer grade_num);	// 등급별 총 좌석개수
	
	/* 좌석정보 */
	public void insertSeat(SeatVO seatVO);	// 등록
	public int selectSeatCount(SeatVO seatVO);
	public List<SeatVO> selectSeatList(SeatVO seatVO);
	public SeatVO selectSeat(Integer seat_num);	// 상세
	public void updateSeat(SeatVO seatVO);	// 수정
	public Integer selectSeatQuantity(Integer grade_num);	// 등급별 좌석개수
	
	public MemberDetailVO selectMemberDetail(Integer mem_num);	// 회원 상세정보
	
	
	/* 경기정보 */
	public void insertGame(GameVO gameVO);	// 등록
	public int selectRowCount(GameVO gameVO);
	public List<GameVO> selectTicketGameList(GameVO gameVO);
	public GameVO selectGame(Integer game_num);	// 경기정보를 이용해 경기정보 구하기
	public void updateGame(GameVO gameVO);	// 수정
	
	/* 티켓 결제 */
	public int selectCheckNum();
	public void insertTicketCheck(TicketCheckVO ticketCheckVO);	// 좌석선택정보 저장
	public List<TicketCheckVO> selectCheckList(Integer check_num);	// 좌석선택정보
	public void deleteCheck(Integer mem_num, Integer game_num);
	
	public int selectStatusNum();
	public void insertSeatStatus(SeatStatusVO seatStatusVO);	// 좌석예매정보 등록
	public List<SeatStatusVO> selectStatusByGame(Integer game_num);
	public List<SeatStatusVO> selectStatusBySeat(Integer seat_num);
	public int selectCountBySeatNum(Integer game_num, Integer seat_num);
	public int selectCountByGradeNum(Integer game_num, Integer grade_num);
	
	public int selectAdminCountBySeatNum(Integer seat_num);
	public int selectAdminCountByGradeNum(Integer grade_num);
	
	public List<SeatStatusVO> selectSeatInfo(Integer status_num);
	
	public void deleteStatus(Integer status_num);
	
	public void insertTicket(TicketVO ticket);	// 티켓주문
	public TicketVO selectTicket(String ticket_num);
}
