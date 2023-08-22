package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import kr.spring.interceptor.AdminCheckInterceptor;
import kr.spring.interceptor.CompanyCheckInterceptor;
import kr.spring.interceptor.LoginCheckInterceptor;

// Java Code 기반 설정 Class
@Configuration
public class AppConfig implements WebMvcConfigurer {
	private LoginCheckInterceptor loginCheck;
	private CompanyCheckInterceptor compCheck;
	private AdminCheckInterceptor adminCheck;
	
	
	@Bean
	public LoginCheckInterceptor interceptor1() {
		loginCheck = new LoginCheckInterceptor();
		return loginCheck;
	}
	
	@Bean
	public CompanyCheckInterceptor interceptor2() {
		compCheck = new CompanyCheckInterceptor();
		return compCheck;
	}
	
	@Bean
	public AdminCheckInterceptor interceptor3() {
		adminCheck = new AdminCheckInterceptor();
		return adminCheck;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//Login(로그인) 인터셉터 설정
		registry.addInterceptor(loginCheck)
				//오세진 - Food
				.addPathPatterns("/food/foodCompDetailMenu.do")
				.addPathPatterns("/food/foodCompDetailReview.do")
				.addPathPatterns("/food/fixCompFoodList.do")
				.addPathPatterns("/food/addNewFood.do")
				.addPathPatterns("/food/fixFood.do")
				.addPathPatterns("/food/deleteFood.do")
				.addPathPatterns("/food/foodDetail.do")
				.addPathPatterns("/food/foodCartCheck.do")
				.addPathPatterns("/food/foodEmptyCart.do")
				.addPathPatterns("/food/foodAddCart.do")
				//오세진 - 푸드 장바구니
				.addPathPatterns("/food/fcart/foodUserCartList.do")
				//윤현종
				.addPathPatterns("/member/updateMember.do")
				.addPathPatterns("/member/updateCompany.do")
				.addPathPatterns("/member/changePassword.do")
				// Ticket
				.addPathPatterns("/ticket/ticketMain.do")
				.addPathPatterns("/ticket/selectedGrade.do")
				.addPathPatterns("/ticket/selectedBlock.do")
				.addPathPatterns("/ticket/orderForm.do")
				.addPathPatterns("/ticket/insertMPay.do")
				.addPathPatterns("/ticket/ticketReserved.do")
				.addPathPatterns("/ticket/ticketInfo.do")
				.addPathPatterns("/ticket/deleteTorder.do")
				// Chatting
				.addPathPatterns("/chat/chatting.do")
				//권오윤
				.addPathPatterns("/goods/detailQna.do")
				.addPathPatterns("/goods/writeQna.do")
				.addPathPatterns("/goods/writeReview.do")
				.addPathPatterns("/goods/updateReview.do");


		//Comp(기업) 인터셉터 설정
		registry.addInterceptor(compCheck)
		//오세진 - Food
				.addPathPatterns("/food/fixCompFoodList.do")
				.addPathPatterns("/food/addNewFood.do")
				.addPathPatterns("/food/fixFood.do")
				.addPathPatterns("/food/deleteFood.do");
		
		//Admin(관리자) 인터셉터 설정
		registry.addInterceptor(adminCheck)
				// Ticket
				.addPathPatterns("/ticket/gradeList.do")
				.addPathPatterns("/ticket/gradeWrite.do")
				.addPathPatterns("/ticket/gradeUpdate.do")
				.addPathPatterns("/ticket/gradeDelete.do")
				.addPathPatterns("/ticket/seatList.do")
				.addPathPatterns("/ticket/seatWrite.do")
				.addPathPatterns("/ticket/seatUpdate.do")
				.addPathPatterns("/ticket/seatEditForm.do")
				.addPathPatterns("/ticket/seatEdit.do")
				.addPathPatterns("/ticket/gameWrite.do")
				.addPathPatterns("/ticket/gameUpdate.do")
				//권오윤 
				.addPathPatterns("/goods/registerGoods.do")
				.addPathPatterns("/goods/goodsUpdate.do")
				.addPathPatterns("/news/newsWrite.do")
				.addPathPatterns("/news/newsUpdate.do");
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		
		// 해당 경로에 xml 설정 파일 지정
		configurer.setDefinitions(new String[] {
			"/WEB-INF/tiles-def/main.xml", "/WEB-INF/tiles-def/KMS.xml", "/WEB-INF/tiles-def/KOY.xml",
			"/WEB-INF/tiles-def/LHJ.xml", "/WEB-INF/tiles-def/LYJ.xml", "/WEB-INF/tiles-def/NSH.xml",
			"/WEB-INF/tiles-def/OSJ.xml", "/WEB-INF/tiles-def/YHJ.xml"
		});
		
		return configurer;
	}
	
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		
		return tilesViewResolver;
	}
}
