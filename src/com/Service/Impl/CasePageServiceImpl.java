package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.NewsService;
import com.mapper.LoadMapper;
import com.pojo.News;
@Service("CasePageServiceImpl")
public class CasePageServiceImpl implements NewsService {
	@Autowired
	LoadMapper loadMapper;
	
	public List<News> showCase(String country,int currentPage,  int count) {
		int offset = (currentPage-1)*count;
		int limit = count;
		if(country.equals("ALL") || country.equals(""))
		{	
			return loadMapper.showALLCase(offset,limit);
		}
		else
		{
			if(country.equals("China"))
			{	
				return loadMapper.showChinaCase(offset,limit);
			}
			else
			{	
				return loadMapper.showOtherCase(offset,limit);
			}
		}
	}
	
	public List<News> newslist(String newscountry) {
		return null;
	}
	public List<News> caselist(String newscountry) {
		return null;
	}
	public List<News> showNews(String country,int currentPage,  int count) {
		return null;
	}

	@Override
	public News pageShow(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> namePop(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> countryPop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<News> searchResult(String country, String city,
			String caseTimefrom, String caseTimeto, String caseName, int currentPage,  int count) {
		// TODO Auto-generated method stub
		return null;
	}
}
