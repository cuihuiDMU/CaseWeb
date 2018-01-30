package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.NewsService;
import com.mapper.LoadMapper;
import com.pojo.News;

@Service("NewsServiceImpl")
public class NewsServiceImpl implements NewsService {
	@Autowired
	LoadMapper loadMapper;
	
	public List<News> newslist(String newscountry) {
		if(newscountry.equals("ALL") || newscountry.equals(""))
		{	
			return loadMapper.newsALLlist();
		}
		else
		{
			if(newscountry.equals("China"))
			{	
				return loadMapper.newsChinalist();
			}
			else
			{	
				return loadMapper.newsOtherlist();
			}
		}
		
		}

	@Override
	public List<News> caselist(String newscountry) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<News> showNews(String country,int currentPage,  int count) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<News> showCase(String country,int currentPage,  int count) {
		// TODO Auto-generated method stub
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
