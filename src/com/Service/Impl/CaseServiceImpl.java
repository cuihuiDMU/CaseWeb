package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.NewsService;
import com.mapper.LoadMapper;
import com.pojo.News;

@Service("CaseServiceImpl")
public class CaseServiceImpl implements NewsService {
	@Autowired
	LoadMapper loadMapper;
	
	public List<News> caselist(String newscountry) {
		if(newscountry.equals("ALL") || newscountry.equals(""))
		{
			return loadMapper.caseALLlist();
		}
		else
		{
			if(newscountry.equals("China"))
			{	
				return loadMapper.caseChinalist();
			}
			else
			{
				return loadMapper.caseOtherlist();
			}
		}
		
		}

	public List<News> newslist(String newscountry) {
		return null;
	}
	public List<News> showNews(String country,int currentPage,  int count) {
		return null;
	}
	public List<News> showCase(String country,int currentPage,  int count) {
		return null;
	}

	public News pageShow(int id) {
		return null;
	}
	public List<String> namePop(String name) {
		return null;
	}

	@Override
	public List<String> countryPop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<News> searchResult(String country, String city,
			String caseTimefrom, String caseTimeto, String caseName) {
		// TODO Auto-generated method stub
		return null;
	}


}
