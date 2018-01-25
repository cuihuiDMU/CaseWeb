package com.pojo;

//标题、日期、地点、简介、损失、内容
public class News {
	private Integer news_id;
	private String news_country;
	private String news_title;
	private String news_date;
	private String news_site;
	private String news_brief;
	private String news_losses;
	private String news_info;
	private String news_secondary;
	private String ISM;
	private String ISM_figure;
	private String faulttree;
	private String faulttree_figure;
	public String getISM() {
		return ISM;
	}
	public void setISM(String iSM) {
		ISM = iSM;
	}
	public String getISM_figure() {
		return ISM_figure;
	}
	public void setISM_figure(String iSM_figure) {
		ISM_figure = iSM_figure;
	}
	public String getFaulttree() {
		return faulttree;
	}
	public void setFaulttree(String faulttree) {
		this.faulttree = faulttree;
	}
	public String getFaulttree_figure() {
		return faulttree_figure;
	}
	public void setFaulttree_figure(String faulttree_figure) {
		this.faulttree_figure = faulttree_figure;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_date() {
		return news_date;
	}
	public void setNews_date(String news_date) {
		this.news_date = news_date;
	}
	public String getNews_site() {
		return news_site;
	}
	public void setNews_site(String news_site) {
		this.news_site = news_site;
	}
	public String getNews_brief() {
		return news_brief;
	}
	public void setNews_brief(String news_brief) {
		this.news_brief = news_brief;
	}
	public String getNews_losses() {
		return news_losses;
	}
	public void setNews_losses(String news_losses) {
		this.news_losses = news_losses;
	}
	public String getNews_info() {
		return news_info;
	}
	public void setNews_info(String news_info) {
		this.news_info = news_info;
	}
	public Integer getNews_id() {
		return news_id;
	}
	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}
	public String getNews_country() {
		return news_country;
	}
	public void setNews_country(String news_country) {
		this.news_country = news_country;
	}
	public String getNews_secondary() {
		return news_secondary;
	}
	public void setNews_secondary(String news_secondary) {
		this.news_secondary = news_secondary;
	}
	
	@Override
	public String toString() {
		return "News [id=" + news_id + ", title=" + news_title + "]";
	}
}
