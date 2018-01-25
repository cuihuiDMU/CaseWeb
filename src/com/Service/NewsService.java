package com.Service;

import java.util.List;

import com.pojo.News;

public interface NewsService {
	List<News> newslist(String newscountry);
	List<News> caselist(String newscountry);
	List<News> showNews(String country,int currentPage,  int count);
	List<News> showCase(String country,int currentPage,  int count);
	List<String> namePop(String name);
	List<String> countryPop();
	List<News> searchResult(String country,String city,String caseTimefrom,String caseTimeto,String caseName);
 	News pageShow(int id);
}
