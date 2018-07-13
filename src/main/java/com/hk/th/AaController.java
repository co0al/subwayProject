package com.hk.th;

import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.AaService;

@Controller
public class AaController {

private static final Logger logger = LoggerFactory.getLogger(BboardController.class);
	
	@Resource(name="AaService")
	private AaService aasv;
	
	@RequestMapping(value = "/aa/list.do", method = RequestMethod.GET)
	public String bboard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		int cnt = aasv.bboardTotalCount();
		model.addAttribute("total", cnt);
		return "aa/list";
	}
}
