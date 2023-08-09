package kr.spring.gcart.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.gcart.service.GcartService;
import kr.spring.gcart.vo.GcartVO;
import kr.spring.goods.service.GoodsService;
import kr.spring.goods.vo.GoodsOptionVO;
import kr.spring.goods.vo.GoodsVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GcartController {
	@Autowired
	private GcartService cartService;
	@Autowired
	private GoodsService goodsService;

	/*
	 * ======================== 장바구니 목록 조회 ========================
	 */

	@RequestMapping("/gorder/goods_cart.do")
	public String list(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", user.getMem_num());

		// 회원번호별 총구매액
		int all_total = cartService.getTotalByMem_num(map);

		List<GcartVO> list = null;
		if (all_total > 0) {
			list = cartService.getListCart(map);
		}

		model.addAttribute("all_total", all_total);
		model.addAttribute("list", list);

		return "goods_cart";
	}
	/*
	 * @RequestMapping("/gorder/goods_cart.do") public String cartList(HttpSession
	 * session, Model model) { MemberVO user = (MemberVO)
	 * session.getAttribute("user"); if (user == null) { // 로그인 후 이용가능 return
	 * "redirect:/member/login.do"; } int all_total =
	 * cartService.getTotalByMem_num(user.getMem_num());
	 * 
	 * //장바구니에 표현할 리스트 List<GcartVO> list = null; if (all_total > 0) { list =
	 * cartService.getListCart(user.getMem_num()); }
	 * 
	 * //옵션 사이즈 및 재고 GcartVO db_cart = new GcartVO(); List<GoodsOptionVO> optionList
	 * = null; optionList =
	 * goodsService.selectOptionList(db_cart.getGoods_num());//-jsp에서 foreach로
	 * mem_num이 넣은 옵션을 불러오면 됨
	 * 
	 * model.addAttribute("optionList", optionList); model.addAttribute("all_total",
	 * all_total); model.addAttribute("list", list);
	 * 
	 * log.debug("<<장바구니 목록 조회>>");
	 * 
	 * return "goods_cart"; /* - 예상 적립금은 orderForm에서 보여주기!! //포인트 넘겨주기 int lpoint =
	 * 0; for(GcartVO cart : list) { lpoint +=
	 * cart.getGoodsVO().getGoods_dprice()*0.98; //개별 상품의 포인트를 구해야하므로 메서드 호출???? }
	 */

	/*
	 * //포인트 double point = 0.0; for (GcartVO cart : list) { double goodsPrice =
	 * cart.getGoodsVO().getGoods_dprice(); discountedPrice += goodsPrice * 0.98; //
	 * 판매가 * 2% 할인 }
	 * 
	 * 
	 * model.addAttribute("discountedPrice", discountedPrice);
	 */

	/* model.addAttribute("lpoint", lpoint); } */

	// =========== 장바구니 등록 ============
	// 옵션이 다른 경우 다른 상품으로 취급해야한다 -

	@RequestMapping("/cart/write.do")
	@ResponseBody
	public Map<String, String> addToCart(GcartVO cartVO, HttpSession session) {
		Map<String, String> mapJson = new HashMap<String, String>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		// 로그인 x
		if (user == null) {
			mapJson.put("result", "logout");
		}
		// 로그인 o
		else {
			cartVO.setMem_num(user.getMem_num()); // 현재 로그인된 회원의 mem_num 설정
			// 장바구니에 이미 동일 상품이 있는 경우 추가, 없는 경우 새로 등록 작업
			GcartVO db_cart = cartService.getCart(cartVO); // ☆☆goods_num으로 정보를 읽어오는데 옵션이 다른 경우에는 다른 상품 취급 해야함

			// ☆☆ 동일상품x - 옵션이 다르면 다른 상품으로 취급해야함. 옵션이 같은 경우에만 동일 상품 추가해줘야함
			if (db_cart == null) {
				cartService.insertCart(cartVO);
				mapJson.put("result", "success");
			}
			// 동일상품o
			else {
				// 재고를 구하기 위해 상품 정보 호출
				GoodsVO db_goods = goodsService.selectGoods(db_cart.getGoods_num());
				// 굿즈의 옵션 별 재고 가져오기 -다시
				/*
				 * int db_stock = cartService.getStockByoption(db_goods.getGoods_num(),
				 * db_goods.getGoodsOptionVO().getGoods_stock()); log.debug("<<db_stock>>" +
				 * db_stock); // 구매 수량 합산(기존 장바구니에 있던 수량 + 새로 장바구니에 넣은 수량) int order_quantity =
				 * db_cart.getOrder_quantity() + cartVO.getOrder_quantity();
				 * 
				 * // 굿즈 재고보다 장바구니에 담은 수량이 더 많으면 if (db_stock < order_quantity) {
				 * mapJson.put("result", "overquantity"); } // 굿즈 재고가 장바구니에 담은 수량보다 작거나 같으면 else
				 * {
				 */
				// 수량 설정
				// cartVO.setOrder_quantity(order_quantity);
				cartService.updateCartByItem_num(cartVO);
				mapJson.put("result", "success");

			}
		}

		return mapJson;
	}

	/*
	 * ===================== 장바구니 상품 수량 변경 =====================
	 */
	@RequestMapping("/cart/modifyCart.do")
	@ResponseBody
	public Map<String, String> submitModify(GcartVO cartVO, HttpSession session) {
		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			mapJson.put("result", "logout");
		} else {
			// 현재 구매하고자 하는 상품의 재고수를 구함
			GoodsVO goods = goodsService.selectGoods(cartVO.getGoods_num());
			if (goods.getGoods_status() == 2) {// 상품 미표시
				mapJson.put("result", "noSale");
			} /*
				 * else if (goods.getGoodsOptionVO().getGoods_stock() <
				 * cartVO.getOrder_quantity()) { // 재고 부족 mapJson.put("result", "noQuantity"); }
				 */ else {// 상품 수량 변경 가능
				cartService.updateCart(cartVO);

				mapJson.put("result", "success");
			}
		}
		return mapJson;
	}

	/*
	 * ===================== 장바구니 상품 삭제 =====================
	 */
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public Map<String, String> delete(@RequestParam int cart_num, HttpSession session) {
		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			mapJson.put("result", "logout");
		} else {
			cartService.deleteCart(cart_num);
			mapJson.put("result", "success");
		}
		return mapJson;
	}

}// end Controller
