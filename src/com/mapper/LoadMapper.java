package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.pojo.News;
@Repository
public interface LoadMapper {
	 
    public void add(News news);  
       
    public void delete(int id);  
       
    public News get(int id);  
     
    public void update(News news);   
       
    public List<News> newsALLlist();
    
    public List<News> newsChinalist();

    public List<News> newsOtherlist();
    
    public List<News> caseALLlist();
    
    public List<News> caseChinalist();

    public List<News> caseOtherlist();
    
    public List<News> showALLNews(int currentPage,  int count);
    
    public List<News> showChinaNews(int currentPage,  int count);

    public List<News> showOtherNews(int currentPage,  int count);
    
    public List<News> showALLCase(int currentPage,  int count);
    
    public List<News> showChinaCase(int currentPage,  int count);

    public List<News> showOtherCase(int currentPage,  int count);
    
    public News pageShow(int id);
    
    public List<String> namePop(String name);
    
    public List<String> countryPop();
    
    public List<News> searchResult(@Param("country")String country, @Param("city")String city, @Param("from")String from,@Param("to")String to,@Param("caseName")String caseName,@Param("offset")int offset,@Param("limit")int limit);
    public int count();
    
}
