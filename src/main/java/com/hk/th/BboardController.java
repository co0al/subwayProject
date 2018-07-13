package com.hk.th;

import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.BboardService;
import com.hk.th.vo.BboardVo;

@Controller
public class BboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BboardController.class);
	
	@Resource(name="BboardService")
	private BboardService bbsv;
	
	@RequestMapping(value = "/bboard/list.do", method = RequestMethod.GET)
	public String bboard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int cnt = bbsv.bboardTotalCount();
		model.addAttribute("total", cnt);
		
		ArrayList<BboardVo> list = bbsv.bboardList();
		model.addAttribute("bblist", list);
		
		return "bboard/list";
	}

}
