package com.Service.Impl;

import com.Service.CrawlerService;
import com.mapper.CrawlerMapper;
import com.pojo.CrawlerCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("crawlerServiceImpl")
public class CrawlerServiceImpl implements CrawlerService {

    @Autowired
    CrawlerMapper crawlerMapper;
    @Override
    public boolean saveCrawlerCase(CrawlerCase crawlerCase) {
        try {
            int isSuccess = crawlerMapper.saveCrawlerCase(crawlerCase);
            if (isSuccess>0)
                return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
