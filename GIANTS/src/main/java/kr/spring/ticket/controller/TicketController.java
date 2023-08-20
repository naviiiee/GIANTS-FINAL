package kr.spring.ticket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siot.IamportRestClient.IamportClient;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.ticket.service.TicketService;
import kr.spring.ticket.vo.GameVO;
import kr.spring.ticket.vo.GradeVO;
import kr.spring.ticket.vo.SeatStatusVO;
import kr.spring.ticket.vo.SeatVO;
import kr.spring.ticket.vo.TicketCheckVO;
import kr.spring.ticket.vo.TicketVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private MemberService memberService;
	
	// javaBean(VO) 초기화
	@ModelAttribute
	public GameVO initGame() { return new GameVO(); }
	
	private IamportClient api;
	
	//토큰 발급
	public TicketController() { this.api = new IamportClient("1867137175507113","3q0a9Ci8ajmex1F1yhDwBz9lSDf6pXne8sEjKpxxe4Tqw1DPRjzLGqvhJ0pIiieTV0q8oMRTn1QVXSuf"); }
	
	/* ----- [Ticket] 메인(요금안내 및 티켓예매 버튼 활성화) -----*/
	@RequestMapping("/ticket/ticket.do")
	public String ticketInfo() { return "ticket"; }
	
	/* ----- [Game] 경기목록 -----*/
	@RequestMapping("/ticket/gameList.do")
	public String gameList(GameVO gameVO, Model model) {
		int count = ticketService.selectRowCount(gameVO);
		
		List<GameVO> list = ticketService.selectTicketGameList(gameVO);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "gameList";
	}
	
	/* ----- [Ticket] 예매메인 -----*/
	@RequestMapping("/ticket/ticketMain.do")
	public String ticketMain(@RequestParam int game_num, GradeVO gradeVO, Model model) {
		log.debug("<<gradeVO : >>" + gradeVO);
		
		List<GradeVO> list = ticketService.selectGradeList(gradeVO);
		
		for(GradeVO grade : list) {
			int count = ticketService.selectCountByGradeNum(game_num, grade.getGrade_num());
			int quantity = grade.getQuantity();
			
			if(count > 0) { grade.setQuantity(quantity - count); }
		}
		
		model.addAttribute("game_num", game_num);
		model.addAttribute("list", list);
		
		return "ticketMain";
	}
	
	/* ----- [Ticket] 등급선택 후 블록정보 출력 -----*/
	@RequestMapping("/ticket/selectedGrade.do")
	@ResponseBody
	public Map<String, Object> selectedGrade(@RequestParam int game_num, @RequestParam int grade_num, SeatVO seatVO, HttpSession session) {
		log.debug("<<grade_num>> : " + grade_num);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		List<SeatVO> list = null;
		List<SeatStatusVO> status = null;
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) { mapJson.put("result", "logout"); }
		else {
			list = ticketService.selectSeatList(seatVO);
			status = ticketService.selectStatusByGame(game_num);
			
			for(SeatVO seat : list) {
				int count = ticketService.selectCountBySeatNum(game_num, seat.getSeat_num());
				int seat_quantity = seat.getSeat_quantity();
				
				if(count > 0) { seat.setSeat_quantity(seat_quantity - count); }
			}
			
			mapJson.put("result", "success");
			mapJson.put("list", list);
			mapJson.put("status", status);
		}
		
		return mapJson;
	}
	
	/* ----- [Ticket] 블록선택 후 좌석정보 출력 -----*/
	@RequestMapping("/ticket/selectedBlock.do")
	@ResponseBody
	public Map<String, Object> selectedBlock(@RequestParam int seat_num, @RequestParam int game_num, HttpSession session) {
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) { mapJson.put("result", "logout"); }
		else {
			SeatVO seat =  ticketService.selectSeat(seat_num);
			log.debug("<<seat>> : " + seat);
			
			List<SeatStatusVO> status = ticketService.selectStatusByGame(game_num);
			log.debug("<<status>> : " + status);
			
			mapJson.put("result", "success");
			mapJson.put("seat", seat);
			mapJson.put("status", status);
		}
		
		return mapJson;
	}
	
	/* ----- [Order] 티켓주문 -----*/
	@PostMapping("/ticket/orderForm.do")
	public String orderTicketForm(@RequestParam int game_num, @RequestParam int grade_num, @RequestParam int seat_num, SeatVO seatVO, HttpSession session, Model model) {
		log.debug("<<seat_info>> : " + seatVO.getSeat_info());
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user == null) { return "redirect:/member/login.do"; }
		
		seatVO.setDetailVO(ticketService.selectMemberDetail(user.getMem_num()));
		
		GameVO gameVO = ticketService.selectGame(game_num);
		GradeVO gradeVO = ticketService.selectGrade(grade_num);
		
		TicketCheckVO checkVO = new TicketCheckVO();
		int check_num = ticketService.selectCheckNum();
		
		int length = seatVO.getSeat_info().split(",").length;
		for(int i = 0; i < length; i++) {
			checkVO.setCheck_num(check_num);
			checkVO.setSeat_num(seat_num);
			checkVO.setSeat_info(seatVO.getSeat_info().split(",")[i]);
			checkVO.setGame_num(game_num);
			checkVO.setMem_num(user.getMem_num());
			
			ticketService.insertTicketCheck(checkVO);
		}
		
		model.addAttribute("seatVO", seatVO);
		model.addAttribute("gameVO", gameVO);
		model.addAttribute("gradeVO", gradeVO);
		model.addAttribute("checkVO", checkVO);
		
		return "ticketOrderForm";
	}
	
	/* ----- [Order] 결제 완료 -----*/
	@RequestMapping("/ticket/insertMPay.do")
	@ResponseBody
	public String insertMPay(@RequestBody TicketVO ticketVO, HttpSession session, RedirectAttributes rttr) {		
		MemberVO user = (MemberVO)session.getAttribute("user");
		ticketVO.setMem_num(user.getMem_num());
		
		log.debug("<<ticketVO>> : " + ticketVO);
		
		int check_num = ticketVO.getCheck_num();
		int status_num = ticketService.selectStatusNum();
		
		List<TicketCheckVO> checkList = ticketService.selectCheckList(check_num);
		//List<SeatStatusVO> statusList = new ArrayList<SeatStatusVO>();
		
		for(TicketCheckVO check : checkList) {
			SeatStatusVO status = new SeatStatusVO();
			status.setStatus_num(status_num);
			status.setGrade_num(ticketVO.getGrade_num());
			status.setSeat_num(check.getSeat_num());
			status.setSeat_info(check.getSeat_info());
			status.setGame_num(ticketVO.getGame_num());
			status.setSeat_auth(1);
			
			ticketService.insertSeatStatus(status);
		}
		log.debug("<<status_num>> : " + status_num);
		ticketVO.setStatus_num(status_num);
		
		ticketService.insertTicket(ticketVO);
		
		// 결제 완료 후 ticket_check 테이블에 있는 필요없는 정보(해당 mem_num과 game_num) 삭제
		ticketService.deleteCheck(user.getMem_num(), ticketVO.getGame_num());
		
		return "/ticket/gameList.do";	// 결제이후 이동할 주소 지정
	}
}
