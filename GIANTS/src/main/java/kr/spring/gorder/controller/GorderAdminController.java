package kr.spring.gorder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.gorder.service.GorderService;
import kr.spring.gorder.vo.GorderDetailVO;
import kr.spring.gorder.vo.GorderVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GorderAdminController {
	@Autowired
	private GorderService orderService;

	/*
	 * ====================== 주문 목록 ======================
	 */
	@RequestMapping("/gorder/admin_list.do")
	public ModelAndView admin_list(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		// 전체/검색 레코드 수
		int count = orderService.selectOrderCount(map);

		log.debug("<<count>> : " + count);

		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 20, 10, "admin_list.do");

		List<GorderVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			list = orderService.selectListOrder(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminOrderList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());

		return mav; //adminOrderList
	}

	/*
	 * ====================== 주문 내역 ======================
	 */
	@RequestMapping("/gorder/admin_detail.do")
	public String adminDetail(@RequestParam int order_num, Model model) {
		GorderVO order = orderService.selectOrder(order_num);

		List<GorderDetailVO> detailList = orderService.selectListOrderDetail(order_num);

		model.addAttribute("orderVO", order);
		model.addAttribute("detailList", detailList);

		return "adminOrderDetail";
	}

	/*
	 * ====================== 배송지정보수정 ======================
	 */
	// 배송지정보수정 폼 호출
	@GetMapping("/gorder/admin_modify.do")
	public String formModify(@RequestParam int order_num, Model model) {
		GorderVO order = orderService.selectOrder(order_num);
		model.addAttribute("orderVO", order);

		return "adminOrderModify";
	}

	// 전송된 데이터 처리
	@PostMapping("/order/admin_modify.do")
	public String submitModify(@Valid GorderVO orderVO, BindingResult result, Model model, HttpServletRequest request) {

		log.debug("<<OrderVO>> : " + orderVO);

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			return "adminOrderModify";
		}

		GorderVO db_order = orderService.selectOrder(orderVO.getOrder_num());
		log.debug("<<배송지정보수정 - 배송상태>> : " + db_order.getOrder_status());
		if (db_order.getOrder_status() == 5) {
			// 주문취소일 경우 배송지정보를 수정할 수 없음
			model.addAttribute("message", "사용자가 주문을 취소하여 배송지정보를 수정할 수 없습니다.");
			model.addAttribute("url",
					request.getContextPath() + "/order/admin_detail.do?order_num=" + orderVO.getOrder_num());
		} else {
			orderService.updateOrder(orderVO);

			model.addAttribute("message", "배송지 정보가 변경되었습니다.");
			model.addAttribute("url", request.getContextPath() + "/order/admin_detail.do?order_num=" + orderVO.getOrder_num());
		}

		return "common/resultView";
	}

	/*
	 * ====================== 배송상태수정 ======================
	 */
	// 배송상태수정 폼 호출
	@GetMapping("/gorder/admin_status.do")
	public String formStatus(@RequestParam int order_num, Model model) {
		GorderVO order = orderService.selectOrder(order_num);
		model.addAttribute("orderVO", order);

		return "adminOrderStatus";
	}

	// 전송된 데이터 처리
	@PostMapping("/gorder/admin_status.do")
	public String submitStatus(GorderVO orderVO, Model model, HttpServletRequest request) {
		GorderVO db_order = orderService.selectOrder(orderVO.getOrder_num());
		log.debug("<<배송상태수정>> : " + db_order.getOrder_status());

		if (db_order.getOrder_status() == 5) {
			// 주문취소시 배송상태수정 불가
			model.addAttribute("message", "사용자가 주문을 취소하여 배송상태를 수정할 수 없습니다.");
			model.addAttribute("url",
					request.getContextPath() + "/order/admin_detail.do?order_num=" + orderVO.getOrder_num());
		} else {
			orderService.updateOrderStatus(orderVO);

			model.addAttribute("message", "배송상태가 수정되었습니다.");
			model.addAttribute("url", request.getContextPath() + "/order/admin_status.do?order_num=" + orderVO.getOrder_num());
		}

		return "common/resultView";
	}
}
