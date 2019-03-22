package com.Controller.crawler;

import com.Service.CrawlerService;
import com.alibaba.fastjson.JSONObject;
import com.pojo.CrawlerCase;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Optional;

/*
http://accident.nrcc.com.cn:9090/Portalsite/List.aspx?pmenu=599438a7-9782-421b-8551-87bf419938ce&menu=4fbb3f04-715f-4791-aff2-a1aaef7dcf59
http://accident.nrcc.com.cn:9090/Portalsite/List.aspx?pmenu=599438a7-9782-421b-8551-87bf419938ce&menu=4fbb3f04-715f-4791-aff2-a1aaef7dcf59&pagenum=2
http://accident.nrcc.com.cn:9090/Portalsite/List.aspx?pmenu=599438a7-9782-421b-8551-87bf419938ce&menu=4fbb3f04-715f-4791-aff2-a1aaef7dcf59&pagenum=3
*/
@Controller
@RequestMapping("")
public class NrccCrawlerController {

    @Autowired
    @Qualifier("crawlerServiceImpl")
    CrawlerService crawlerService;



    @RequestMapping("nrccCrawler")
    public void nrccCrawler(HttpServletRequest request, HttpServletResponse response) throws IOException{

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String nrccPage = request.getParameter("pageNum");
        int page = Integer.getInteger(nrccPage);

        String result = crawler(page);

        JSONObject jsonobj = new JSONObject();
        jsonobj.put("status",result);
        response.setContentType("application/x-json");
        PrintWriter out = response.getWriter();
        out.write(jsonobj.toString());
    }

    public String crawler(int pages){

        String url = "http://accident.nrcc.com.cn:9090/Portalsite/List.aspx?pmenu=599438a7-9782-421b-8551-87bf419938ce&menu=4fbb3f04-715f-4791-aff2-a1aaef7dcf59";
        String result = "获取信息失败";

        if (pages>1){
            boolean part1 = false;//判断第一页内容是否获取成功
            boolean part2 = false;//判断后面页的内容是否获取成功
            int pageCrawlered = 0;
            Document doc = null;
            try {
                doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36").timeout(3000).post();
            } catch (IOException e) {
                e.printStackTrace();
            }

            /*共11191条事故，2239页          匹配2239，获取总页数 page_a span*/
            Elements pageEle = doc.select("div[class=page_a]>span");
            final String spanString = pageEle.text();
            String splitstring = spanString.split("，")[1];
            int pageNumber = Integer.valueOf(splitstring.substring(0,splitstring.length()-1));
            part1 = getArticleList(url);
            if (part1) pageCrawlered++;
            for (int i=2;i<pageNumber/100;i++){
                final String urlAppend= new StringBuffer(url).append("&pagenum=").append(i).toString();
                part2 = getArticleList(urlAppend);
                if (part2) pageCrawlered++;
            }
            result = "成功获得"+pageCrawlered+"页数据";
        }else{
            boolean isSuccess = getArticleList(url);
            if (isSuccess) result = "成功获得1页数据";
        }

        return result;
    }


    public boolean getArticleList(final String listurl){
        boolean result = false;
        boolean feedback = false;
        Document document = null;
        try {
            document = Jsoup.connect(listurl).userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36").timeout(3000).post();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Elements elements = document.select("div[class=new_list]>a");//找到所有a标签
        for (Element element : elements) {
            final String relHref = element.attr("href"); // == "/"这个是href的属性值，一般都是链接。这里放的是文章的连接
            feedback = getArticleFromUrl(relHref);
            if (feedback) result = true;
        }
        return result;
    }
    public boolean getArticleFromUrl(String linkUrl) {
        boolean result = false;
        Document docum = null;
        String detailUrl = new StringBuffer("http://accident.nrcc.com.cn:9090/Portalsite/").append(linkUrl).toString();
        try {
            docum = Jsoup.connect(detailUrl).userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36").timeout(3000).post();
            Element elementTitle = docum.getElementById("ContentPlaceHolder1_lblFullHead");//标题。 这边根据class的内容来过滤
            Element elementTime = docum.getElementById("ContentPlaceHolder1_lblCreateDate");//标题。 这边根据class的内容来过滤
            Elements pageContent = docum.select("div[class=content_text]>p");
            Optional<Element> optTitle = Optional.ofNullable(elementTitle);
            Optional<Element> optTime = Optional.ofNullable(elementTime);
            String contentStr = pageContent.text();
            if (!(optTitle.isPresent()||optTime.isPresent()||contentStr.length()==0)){  //记录错误数据
                System.out.println("错误数据一条");
                return false;
            }
            CrawlerCase crawlerCase = new CrawlerCase(elementTitle.text(),elementTime.text(),contentStr);
            result = saveArticle(crawlerCase);
        }catch (IOException e){
            e.printStackTrace();
        }
        return result;
    }
    public boolean saveArticle(CrawlerCase crawlerCase) {
        boolean result = false;
        //String lujing = "d:\\crawler\\accident.nrcc.com.cn9090\\" + crawlerCase.getCase_name() + ".txt";//保存到本地的路径和文件名
        result = crawlerService.saveCrawlerCase(crawlerCase);
        return result;
    }
}

