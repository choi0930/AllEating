package com.spring.alleating.common.tiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig{
	 @Bean
	 public TilesConfigurer tilesConfigurer() {
	final TilesConfigurer configurer = new TilesConfigurer();
	configurer.setDefinitions(new String[] {"WEB-INF/tiles/tiles_main.xml","WEB-INF/tiles/tiles_product.xml",
			"WEB-INF/tiles/tiles_member.xml","WEB-INF/tiles/tiles_myPage.xml","WEB-INF/tiles/tiles_admin.xml",
			"WEB-INF/tiles/tiles_owner.xml","WEB-INF/tiles/tiles_cart.xml","WEB-INF/tiles/tiles_order.xml","WEB-INF/tiles/tiles_community.xml"});
    configurer.setCheckRefresh(true);
    return configurer;
    
}
@Bean 
public TilesViewResolver tilesViewResolver() {
	final TilesViewResolver resolver = new TilesViewResolver();
	resolver.setViewClass(TilesView.class);
    return resolver;
}
}

