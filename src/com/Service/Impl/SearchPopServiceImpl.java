package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.NewsService;
import com.mapper.LoadMapper;
import com.pojo.News;
@Service("SearchPopServiceImpl")
public class SearchPopServiceImpl implements NewsService {
	@Autowired
	LoadMapper loadMapper;
	
	public List<String> namePop(String name) {
		if(name.equals("")||name == null)
		{
			return null;
		}
		else
		{
			return loadMapper.namePop(name);
		}
	}
	public List<String> countryPop() {
		return loadMapper.countryPop();
	}
	public List<News> searchResult(String country, String city,
			String caseTimefrom, String caseTimeto, String caseName) {
		System.out.println("this is searchpopserviceimpl:"+country+"-"+ city+"-"+ caseTimefrom+"-"+caseName);
		String from = "1900-1-1";
		String to = "2100-1-1";
		if((caseTimefrom != null)&&(caseTimefrom != ""))
		  {
			  from = caseTimefrom;
		  }
		  if((caseTimeto != null)&&(caseTimeto != ""))
		  {
			  to = caseTimeto;
		  }
		return loadMapper.searchResult(country,city,from,to,caseName);
	}
	public List<News> newslist(String newscountry) {
		return null;
	}
	public List<News> caselist(String newscountry) {
		return null;
	}
	public List<News> showNews(String country, int currentPage, int count) {
		return null;
	}
	public List<News> showCase(String country, int currentPage, int count) {
		return null;
	}
	public News pageShow(int id) {
		return null;
	}
	
}
