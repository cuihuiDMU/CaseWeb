package com.mapper;

import com.pojo.CrawlerCase;
import org.springframework.stereotype.Repository;

@Repository
public interface CrawlerMapper {
    public int saveCrawlerCase(CrawlerCase crawlerCase);
}
