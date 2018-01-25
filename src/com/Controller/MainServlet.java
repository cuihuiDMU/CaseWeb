package com.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.News;

@Controller
@RequestMapping("")
public class MainServlet {
	@RequestMapping("")
	public ModelAndView listNews(){
		ModelAndView mav = new ModelAndView("main");
		
		// 放入转发参数
		// mav.addObject("news", news);
		return mav;
	}

}
