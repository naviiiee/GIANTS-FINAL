package kr.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.food.vo.F_orderVO;
import kr.spring.food.vo.FoodVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.CompanyDetailVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberCompanyController {
	@Autowired
	private MemberService memberService;
	
	/*=====================
	 * 기업회원 푸드목록
	 *=====================*/	
	@RequestMapping("/member/compMypageFoodList.do")
	public ModelAndView compMypageFoodList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
										  HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		CompanyDetailVO comp = memberService.selectCompCp(user.getCompanyDetailVO().getComp_num());
		int count = memberService.selectRowCountCp(comp.getComp_num());
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 5, 5, "compMypageFoodList.do");
		
		List<FoodVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			map.put("comp_num", comp.getComp_num());
			
			list = memberService.selectListCp(map);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("compMypageFoodList");
		mav.addObject("comp", comp);
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/*=====================
	 * 기업회원 매출관리
	 *=====================*/
	@RequestMapping("/member/companyMypageSaleManage.do")
	public String companyMypageSaleManage(HttpSession session, Model model) {
		
		return "companyMypageSaleManage";
	}
	
	/*=====================
	 * 기업회원 주문목록
	 *=====================*/
	@RequestMapping("/member/compMypageOrderList.do")
	public ModelAndView admin_list(
			      @RequestParam(value="pageNum",
			          defaultValue="1") int currentPage,
			            String keyfield, String keyword) {
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체/검색 레코드 수
		int count = memberService.selectOrderCountFd(map);
		
		log.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(keyfield,keyword,currentPage,count,20,10,
						 "admin_list.do");
		
		List<F_orderVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = memberService.selectListOrderFd(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminOrderList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
} 