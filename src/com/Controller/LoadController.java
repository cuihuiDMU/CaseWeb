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
public class LoadController {
	@Autowired
	@Qualifier("NewsServiceImpl")
	NewsService newsService;
	
	@Autowired
	@Qualifier("CaseServiceImpl")
	NewsService caseService;
	
	@RequestMapping("loadServlet")
	public void listNews(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		List<News> listNews= newsService.newslist("ALL");
		List<News> listCase= caseService.caselist("ALL");

		JSONArray jsonarray = new JSONArray();
		JSONArray jsonleft = new JSONArray();
		JSONArray jsonright = new JSONArray();

		for(Iterator<News> i = listNews.iterator();i.hasNext();)
		{
		    News nn = i.next();   
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("id",nn.getNews_id());
		jsonobj.put("title",nn.getNews_title());
		jsonobj.put("date",nn.getNews_date());
		jsonleft.add(jsonobj);
		}
		for(Iterator<News> i = listCase.iterator();i.hasNext();)
		{
		    News nn = i.next();   
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("id",nn.getNews_id());
		jsonobj.put("title",nn.getNews_title());
		jsonobj.put("date",nn.getNews_date());
		jsonright.add(jsonobj);
		}
		
		jsonarray.add(jsonleft);
		jsonarray.add(jsonright);
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		out.write(jsonarray.toString());
		}
	
	}

