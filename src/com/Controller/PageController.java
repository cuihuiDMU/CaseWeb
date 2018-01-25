package com.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Service.NewsService;
import com.pojo.News;

@Controller
@RequestMapping("")
public class PageController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	@Qualifier("PageServiceImpl")
	NewsService newsService;
	
	@RequestMapping("pageServlet")
	public ModelAndView listNews(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String news_id=request.getParameter("news_id");
		int id = Integer.parseInt(news_id);
		System.out.println(id);
		
		News news = newsService.pageShow(id);
		
		ModelAndView mav = new ModelAndView("page");
		
		mav.addObject("title", news.getNews_title());
		mav.addObject("site", news.getNews_site());
		mav.addObject("date", news.getNews_date());
		mav.addObject("brief", news.getNews_brief());
		mav.addObject("losses", news.getNews_losses());
		mav.addObject("info", news.getNews_info());
		mav.addObject("secondary", news.getNews_secondary());
		mav.addObject("ISM", news.getISM());
		mav.addObject("ISM_figure", news.getISM_figure());
		mav.addObject("faulttree", news.getFaulttree());
		mav.addObject("faulttree_figure", news.getFaulttree_figure());
		return mav;
	}
	
}
