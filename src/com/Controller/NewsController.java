package com.Controller;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Service.NewsService;
import com.alibaba.fastjson.JSONArray;
import com.pojo.News;

@Controller
@RequestMapping("")
public class NewsController {
	@Autowired
	@Qualifier("NewsServiceImpl")
	NewsService newsService;
	
	@RequestMapping("newsServlet")
	public void listNews(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String newscountry=request.getParameter("newscountry");
		String country=newscountry.substring(4);

		List<News> listNews= newsService.newslist(country);

		JSONArray jsonarray = new JSONArray();

		for(Iterator<News> i = listNews.iterator();i.hasNext();)
		{
		    News nn = i.next();   
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("id",nn.getNews_id());
		jsonobj.put("title",nn.getNews_title());
		jsonarray.add(jsonobj);
		}
		
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		out.write(jsonarray.toString());
		}
	
	}
