package com.hk.th;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.vo.MenuVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	// jstl 동적변수 테스트
	@RequestMapping(value = "/jstltest.do", method = RequestMethod.GET)
	public String jstltest(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		MenuVo korea1 = new MenuVo();
		korea1.setCategory("한식");
		korea1.setMenu("된장찌개");
		korea1.setPrice(5000);
		MenuVo korea2 = new MenuVo();
		korea2.setCategory("한식");
		korea2.setMenu("갈비탕");
		korea2.setPrice(8000);
		
		MenuVo japen1 = new MenuVo();
		japen1.setCategory("일식");
		japen1.setMenu("돈까스");
		japen1.setPrice(10000);
		
		MenuVo japen2 = new MenuVo();
		japen2.setCategory("일식");
		japen2.setMenu("메밀소바");
		japen2.setPrice(5000);
		
		ArrayList<MenuVo> list1 = new ArrayList<MenuVo>();
		list1.add(korea1);
		list1.add(korea2);
		
		ArrayList<MenuVo> list2 = new ArrayList<MenuVo>();
		list2.add(japen1);
		list2.add(japen2);
		
		model.addAttribute("list1", list1 );
		model.addAttribute("list2", list2 );
		
		return "jstltest";
	}
	
}
