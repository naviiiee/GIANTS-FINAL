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



//import com.sun.tools.javac.util.StringUtils;

import kr.spring.gcart.service.GcartService;
import kr.spring.gcart.vo.GcartVO;
import kr.spring.goods.vo.GoodsVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GcartController {
	@Autowired
	private GcartService cartService;

	/*
	 * ======================== 자바빈(VO) 초기화 ========================
	 */
	/*@ModelAttribute
	public GcartVO initCommand() {
		return new GcartVO();
	}*/


	
	/*
	 * ======================== 장바구니 목록 조회 ========================
	 */
	@GetMapping("/gorder/goods_cart.do")
	public String cartList (HttpSession session, Model model){
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인 후 이용가능
			return "redirect:/member/login.do";
		}
		int all_total = cartService.getTotalByMem_num(user.getMem_num());
		
		
		List<GcartVO> list = null;
		
		if(all_total > 0) {
			list = cartService.getListCart(user.getMem_num());
		}
		
		/*
		 * //포인트 넘겨주기 int lpoint = 0; for(GcartVO cart : list) { lpoint +=
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

		
		/* model.addAttribute("lpoint", lpoint); */
		model.addAttribute("all_total", all_total);
		model.addAttribute("list", list);
		
		return "goods_cart";

	}
	//=========== 장바구니 등록 ============
	@PostMapping("/gorder/goods_cart.do")
	public String addToCart(@ModelAttribute("cartVO") GcartVO cartVO, HttpSession session) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    if (user != null) {
	        cartVO.setMem_num(user.getMem_num()); // 현재 로그인된 회원의 mem_num 설정
	        cartService.insertCart(cartVO); // 장바구니에 상품 추가
	        log.debug("<<장바구니 추가 완료!>> : "+cartVO);
	    }
	    return "redirect:/gorder/goods_cart.do"; // 장바구니 페이지로 리다이렉트
	}

	
	
	/*
	 * } else { CartVO cart = new CartVO();
	 * cart.setItem_num(Integer.parseInt(request.getParameter("item_num")));
	 * cart.setOrder_quantity(Integer.parseInt(request.getParameter("order_quantity"
	 * ))); cart.setMem_num(user_num);
	 * 
	 * CartDAO dao = CartDAO.getInstance(); CartVO db_cart = dao.getCart(cart);
	 * if(db_cart == null) { // 동일상품이 없을 경우 dao.insertCart(cart);
	 * mapAjax.put("result", "success"); } else { // 동일 상품이 있을 경우 // 재고수를 구하기 위해서
	 * ItemDAO를 호출 ItemDAO itemDao = ItemDAO.getInstance(); ItemVO item =
	 * itemDao.getItem(db_cart.getItem_num()); // 구매수량 합산(기존 방바구니에 저장된 구매수량 + 새로 입력한
	 * 구매 수량) int order_quantity = db_cart.getOrder_quantity() +
	 * cart.getOrder_quantity();
	 * 
	 * if(item.getItem_stock() < order_quantity) { // 상품 재고 수량보다 장바구니에 다음 구매 수량이 더
	 * 많음 mapAjax.put("result", "over_quantity"); } else {
	 * cart.setOrder_quantity(order_quantity); dao.updateCartByItem_num(cart);
	 * mapAjax.put("result", "success"); } }
	 */

	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// end Controller
