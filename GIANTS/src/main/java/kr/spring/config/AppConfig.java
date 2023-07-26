package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

// Java Code 기반 설정 Class
@Configuration
public class AppConfig implements WebMvcConfigurer {

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
