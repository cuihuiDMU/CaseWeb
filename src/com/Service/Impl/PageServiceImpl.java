package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.NewsService;
import com.mapper.LoadMapper;
import com.pojo.News;

@Service("PageServiceImpl")
public class PageServiceImpl implements NewsService {
	@Autowired
	LoadMapper loadMapper;
	
	public News pageShow(int id) {
		return loadMapper.pageShow(id);
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
	public List<News> showCase(String country,int currentPage,  int count) {
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
			String caseTimefrom, String caseTimeto, String caseName, int currentPage,  int count) {
		// TODO Auto-generated method stub
		return null;
	}
}

