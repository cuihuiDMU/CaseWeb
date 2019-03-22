package com.pojo;

public class CrawlerCase {
    private int case_id;
    private String case_name;
    private String case_time;
    private String case_detail;

    public int getCase_id() {
        return case_id;
    }

    public void setCase_id(int case_id) {
        this.case_id = case_id;
    }

    public String getCase_name() {
        return case_name;
    }

    public void setCase_name(String case_name) {
        this.case_name = case_name;
    }

    public String getCase_time() {
        return case_time;
    }

    public void setCase_time(String case_time) {
        this.case_time = case_time;
    }

    public String getCase_detail() {
        return case_detail;
    }

    public void setCase_detail(String case_detail) {
        this.case_detail = case_detail;
    }

    public CrawlerCase(String case_name, String case_time, String case_detail) {
        this.case_name = case_name;
        this.case_time = case_time;
        this.case_detail = case_detail;
    }

    public CrawlerCase() {
    }
}
