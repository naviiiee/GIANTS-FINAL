package kr.spring.gorder.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.gcart.service.GcartService;
import kr.spring.gcart.vo.GcartVO;
import kr.spring.goods.service.GoodsService;
import kr.spring.goods.vo.GoodsVO;
import kr.spring.gorder.service.GorderService;
import kr.spring.gorder.vo.GorderDetailVO;
import kr.spring.gorder.vo.GorderVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GorderController {
	@Autowired
	private GorderService orderService;

	@Autowired
	private GcartService cartService;

	@Autowired
	private GoodsService goodsService;

	@Autowired
	private MemberService memberService;

	@ModelAttribute("orderVO")
	public GorderVO initCommand() {
		return new GorderVO();
	}

	/*
	 * ==================== 상품 구매 ====================
	 */
	// 상품 구매 폼 호출
	@PostMapping("/gorder/orderForm.do")
	public String form(@ModelAttribute("orderVO") GorderVO orderVO, HttpSession session, Model model,
			HttpServletRequest request) {
		log.debug("<<cart_numbers>> : " + orderVO.getCart_numbers());

		if (orderVO.getCart_numbers() == null || orderVO.getCart_numbers().length == 0) {
			model.addAttribute("message", "정상적인 주문이 아닙니다.");
			model.addAttribute("url", request.getContextPath() + "/gorder/goods_cart.do");
			return "common/resultView";
		}

		MemberVO user = (MemberVO) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", user.getMem_num());
		map.put("cart_numbers", orderVO.getCart_numbers());
		int all_total = cartService.getTotalByMem_num(map);
		if (all_total <= 0) {
			model.addAttribute("message", "정상적인 주문이 아니거나 상품의 수량이 부족합니다.");
			model.addAttribute("url", request.getContextPath() + "/gorder/goods_cart.do");
			return "common/resultView";
		}

		// 장바구니에 담겨있는 상품 정보 호출
		List<GcartVO> cartList = cartService.getListCart(map);
		for (GcartVO cart : cartList) {
			GoodsVO goods = goodsService.selectGoods(cart.getGoods_num());
			if (goods.getGoods_status() == 2) {
				// 상품 미표시
				model.addAttribute("message", "[" + goods.getGoods_name() + "]상품판매 중지");
				model.addAttribute("url", request.getContextPath() + "/gorder/goods_cart.do");
				return "common/resultView";
			}

			/*
			 * if(goods.getGoodsOptionVO().getGoods_stock() < cart.getOrder_quantity()) {
			 * //상품 재고 수량 부족 model.addAttribute("message",
			 * "["+goods.getGoods_name()+"]재고수량 부족으로 주문 불가"); model.addAttribute("url",
			 * request.getContextPath()+"/gorder/goods_cart.do"); return
			 * "common/resultView"; }
			 */
		}

		model.addAttribute("list", cartList);
		model.addAttribute("all_total", all_total);

		return "/gorder/orderForm";
	}

	// 전송된 데이터 처리 - api 사용
	@PostMapping("/gorder/order.do")
	public String submit(@Valid GorderVO orderVO, BindingResult result, HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		log.debug("<<OrderVO>> : " + orderVO);

		// 전송된 데이터 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			return form(orderVO, session, model, request);
		}

		if (orderVO.getCart_numbers() == null || orderVO.getCart_numbers().length == 0) {
			model.addAttribute("message", "정상적인 주문이 아닙니다.");
			model.addAttribute("url", request.getContextPath() + "/cart/list.do");
			return "common/resultView";
		}

		MemberVO user = (MemberVO) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", user.getMem_num());
		map.put("cart_numbers", orderVO.getCart_numbers());
		int all_total = cartService.getTotalByMem_num(map);
		if (all_total <= 0) {
			model.addAttribute("message", "정상적인 주문이 아니거나 상품의 수량이 부족합니다.");
			model.addAttribute("url", request.getContextPath() + "/gorder/goods_cart.do");
			return "common/resultView";
		}

		// 장바구니에 담겨있는 상품 정보 호출
		List<GcartVO> cartList = cartService.getListCart(map);

		// 개별 주문 상품 저장
		List<GorderDetailVO> orderDetailList = new ArrayList<GorderDetailVO>();
		for (GcartVO cart : cartList) {
			GoodsVO goods = goodsService.selectGoods(cart.getGoods_num());

			if (goods.getGoods_status() == 2) {
				// 상품 미표시
				model.addAttribute("message", "[" + goods.getGoods_name() + "]상품판매 중지");
				model.addAttribute("url", request.getContextPath() + "/gorder/goods_cart.do");
				return "common/resultView";
			}

			if (goods.getGoodsOptionVO().getGoods_stock() < cart.getOrder_quantity()) {
				// 상품 재고 수량 부족
				model.addAttribute("message", "[" + goods.getGoods_name() + "]재고수량 부족으로 주문 불가");
				model.addAttribute("url", request.getContextPath() + "/gorder/goods_cart.do");
				return "common/resultView";
			}

			GorderDetailVO orderDetail = new GorderDetailVO();
			orderDetail.setGoods_num(cart.getGoods_num());
			orderDetail.setGoods_name(cart.getGoodsVO().getGoods_name());
			orderDetail.setGoods_dprice(cart.getGoodsVO().getGoods_dprice());
			// 배송비 셋팅 - 5만원 이상 시 무료배송
			if (cart.getOrder_quantity() * cart.getGoodsVO().getGoods_dprice() >= 50000) {
				orderDetail.setOrder_dcost(0);
			}
			orderDetail.setOrder_quantity(cart.getOrder_quantity());
			// 동일 상품의 합계 금액
			orderDetail.setGoods_total(cart.getSub_total());

			orderDetailList.add(orderDetail);
		}

		// 주문 상품의 대표 상품명 생성
		String goods_name = "";
		if (cartList.size() == 1) {
			goods_name = cartList.get(0).getGoodsVO().getGoods_name();
		} else {
			goods_name = cartList.get(0).getGoodsVO().getGoods_name() + "외 " + (cartList.size() - 1) + "건";
		}

		orderVO.setGoods_name(goods_name);
		orderVO.setOrder_total(all_total);
		orderVO.setMem_num(user.getMem_num());

		orderService.insertOrder(orderVO, orderDetailList);

		// Refresh 정보를 응답 헤더에 추가
		response.addHeader("Refresh", "2;url=../main/main.do");
		model.addAttribute("accessMsg", "주문이 완료되었습니다.");

		return "common/notice";
	}

	/*
	 * ==================== 회원 주소 읽기(배송지 선택) ====================
	 */
	@RequestMapping("/gorder/getMemberAddress.do")
	@ResponseBody
	public Map<String, Object> formAddress(HttpSession session) {
		Map<String, Object> mapJson = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			mapJson.put("result", "logout");
		} else {
			MemberVO db_member = memberService.selectMember(user.getMem_num());
			mapJson.put("result", "success");
			mapJson.put("zipcode", db_member.getMemberDetailVO().getMem_zipcode());
			mapJson.put("address1", db_member.getMemberDetailVO().getMem_address1());
			mapJson.put("address2", db_member.getMemberDetailVO().getMem_address2());
			mapJson.put("phone", db_member.getMemberDetailVO().getMem_phone());
		}

		return mapJson;
	}
}
