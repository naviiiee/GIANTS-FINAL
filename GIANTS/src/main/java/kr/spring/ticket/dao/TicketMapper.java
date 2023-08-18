package kr.spring.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberDetailVO;
import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;
import kr.spring.ticket.vo.SeatStatusVO;
import kr.spring.ticket.vo.SeatVO;
import kr.spring.ticket.vo.TicketCheckVO;
import kr.spring.ticket.vo.TicketVO;

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
	// 경기번호를 이용해 경기정보 구하기
	@Select("SELECT * FROM tgame WHERE game_num = #{game_num}")
	public GameVO selectGame(Integer game_num); 
	// 수정
	@Update("UPDATE tgame SET game_date = #{game_date}, game_time = #{game_time}, game_team = #{game_team},game_state = #{game_state} WHERE game_num = #{game_num}")
	public void updateGame(GameVO gameVO);
	// 삭제
	public void deleteGame(Integer game_num);
	
	/* 좌석등급 */
	// 등록
	public void insertGrade(GradeVO gradeVO);
	// 목록
	@Select("SELECT COUNT(*) FROM grade")
	public int selectGradeCount(GradeVO gradeVO);
	@Select("SELECT * FROM grade ORDER BY grade_num DESC")
	public List<GradeVO> selectGradeList(GradeVO gradeVO);
	// 상세
	@Select("SELECT * FROM grade WHERE grade_num = #{grade_num}")
	public GradeVO selectGrade(Integer grade_num);
	// 수정
	@Update("UPDATE grade SET title = #{title}, price_week = #{price_week}, price_weekend = #{price_weekend} WHERE grade_num = #{grade_num}")
	public void updateGrade(GradeVO gradeVO);
	// 삭제
	@Delete("DELETE FROM grade WHERE grade_num = #{grade_num}")
	public void deleteGrade(Integer grade_num);
	// 등급별 총 좌석개수
	@Update("UPDATE grade SET quantity = (SELECT SUM(seat_quantity) FROM seat WHERE grade_num = #{grade_num}) WHERE grade_num = #{grade_num}")
	public void updateGradeQuantity(Integer grade_num);
	
	/* 좌석정보 */
	// 등록
	public void insertSeat(SeatVO seatVO);
	// 목록
	@Select("SELECT COUNT(*) FROM seat WHERE grade_num = #{grade_num}")
	public int selectSeatCount(SeatVO seatVO);
	@Select("SELECT * FROM seat WHERE grade_num = #{grade_num} ORDER BY seat_num DESC")
	public List<SeatVO> selectSeatList(SeatVO seatVO);
	// 상세
	@Select("SELECT * FROM seat WHERE seat_num = #{seat_num}")
	public SeatVO selectSeat(Integer seat_num);
	// 수정
	@Update("UPDATE seat SET seat_block = #{seat_block}, seat_row = #{seat_row}, seat_col = #{seat_col}, seat_quantity = #{seat_quantity} WHERE seat_num = #{seat_num}")
	public void updateSeat(SeatVO seatVO);
	// 삭제
	@Delete("DELETE FROM seat WHERE grade_num = #{grade_num}")
	public void deleteSeat(Integer grade_num);
	// 등급별 좌석개수
	@Select("SELECT SUM(seat_quantity) FROM seat WHERE grade_num = #{grade_num}")
	public Integer selectSeatQuantity(Integer grade_num);
	
	@Select("SELECT * FROM member_detail WHERE mem_num = #{mem_num}")
	public MemberDetailVO selectMemberDetail(Integer mem_num);
	
	/* 티켓 결제 */
	@Select("SELECT ticket_check_seq.nextval FROM dual")
	public int selectCheckNum();	// 좌석선택 확인용 번호 생성
	@Insert("INSERT INTO ticket_check (check_num, seat_info, game_num, mem_num) VALUES(#{check_num}, #{seat_info}, #{game_num}, #{mem_num})")
	public void insertTicketCheck(TicketCheckVO ticketCheckVO);	// 좌석선택정보 저장
	@Delete("DELETE FROM ticket_check WHERE check_num = #{check_num}")
	public void deleteTicketCheck(Integer check_num);	// 좌석선택정보 삭제
	@Insert("INSERT INTO seat_status (status_num, seat_info, seat_date, seat_auth) VALUES(seat_status_seq.nextval, #{seat_info}, #{seat_date}, #{seat_auth})")
	public void insertSeatStatus(SeatStatusVO seatStatusVO);	// 좌석예매정보 등록
	public void insertTicket(TicketVO ticketVO);
}
