package com.Controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
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
public class SearchController {
	@Autowired
	@Qualifier("SearchPopServiceImpl")
	NewsService searchPopService;
	
	@RequestMapping("titlePop")
	public void listTitle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String caseNameSearch=request.getParameter("caseNameSearch");
		if(caseNameSearch!=null&&!(caseNameSearch.equals("")))
        {
			  List<String> listName = searchPopService.namePop(caseNameSearch);
			  JSONArray jsonarray = new JSONArray();
			  for(Iterator<String> i = listName.iterator();i.hasNext();)
				{
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("title",i.next());
				jsonarray.add(jsonobj);
				}
			  
			    response.setContentType("application/x-json");
				PrintWriter out = response.getWriter();
				out.write(jsonarray.toString());
         
        }
		}
	@RequestMapping("countryPop")
	public void listCountry(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		List<String> listCountry= searchPopService.countryPop();

		JSONArray jsonarray = new JSONArray();

		for(Iterator<String> i = listCountry.iterator();i.hasNext();)
		{
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("country",i.next());
			jsonarray.add(jsonobj);
		}
		
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		out.write(jsonarray.toString());
		}
	@RequestMapping("search")
	public void listResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String country_S=request.getParameter("country");
        String city_S=request.getParameter("city");
        String caseTimefrom_S=request.getParameter("caseTimefrom");
        String caseTimeto_S=request.getParameter("caseTimeto");
        String caseName_S=request.getParameter("caseName");
        
        String currentpage = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		int currentPage = Integer.valueOf(currentpage);
		int count = Integer.valueOf(pageSize);
		
		System.out.println(country_S+currentpage+pageSize);
        if(country_S!=null || city_S !=null || caseTimefrom_S !=null || caseTimeto_S !=null || caseName_S !=null)
        {
      	  String country="",city="",caseTimefrom="",caseTimeto="",caseName ="";
      	  if(country_S!=null) 
          	{ country=URLDecoder.decode(country_S, "UTF-8"); }
      	  if(city_S!=null)
          	{  city=URLDecoder.decode(city_S, "UTF-8");}
      	  if(caseTimefrom_S!=null)
          	{ caseTimefrom=URLDecoder.decode(caseTimefrom_S, "UTF-8");}
      	  if(caseTimeto_S!=null)
          	{ caseTimeto=URLDecoder.decode(caseTimeto_S, "UTF-8");}
      	  if(caseName_S!=null)
          	{ caseName=URLDecoder.decode(caseName_S, "UTF-8");}
          
      	  List<News> searchResult= searchPopService.searchResult(country,city,caseTimefrom,caseTimeto,caseName,currentPage,count); 
      	  JSONObject data = new JSONObject();
      	  JSONArray caseSearchArray = new JSONArray();
			  for(Iterator<News> i = searchResult.iterator();i.hasNext();)
				{	News nn = i.next();
					JSONObject jsonobj = new JSONObject();
					jsonobj.put("id",nn.getNews_id());
					jsonobj.put("title", nn.getNews_title());
					caseSearchArray.add(jsonobj);
				}
			  
			  	data.put("pageNo", String.valueOf(currentPage));
				data.put("pages", pageSize);
				data.put("dataList", caseSearchArray);
				
			    response.setContentType("application/x-json");
				PrintWriter out = response.getWriter();
				out.write(data.toString());
        
        }
		
		}
	}