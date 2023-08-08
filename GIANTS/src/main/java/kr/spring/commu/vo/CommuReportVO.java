package kr.spring.commu.vo;


import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommuReportVO {
	private int repo_num; //신고 번호
	private Date repo_date; //신고 날짜
	private String repo_ip; //신고자 ip
	@NotEmpty
	private String repo_content; //신고내용
	@NotEmpty
	private int repo_category; //신고범위
	private int commu_num; //커뮤니티 번호
	private int mem_num; //신고자 회원번호
	
	public int getRepo_num() {
		return repo_num;
	}
	public void setRepo_num(int repo_num) {
		this.repo_num = repo_num;
	}
	public Date getRepo_date() {
		return repo_date;
	}
	public void setRepo_date(Date repo_date) {
		this.repo_date = repo_date;
	}
	public String getRepo_ip() {
		return repo_ip;
	}
	public void setRepo_ip(String repo_ip) {
		this.repo_ip = repo_ip;
	}
	public String getRepo_content() {
		return repo_content;
	}
	public void setRepo_content(String repo_content) {
		this.repo_content = repo_content;
	}
	public int getRepo_category() {
		return repo_category;
	}
	public void setRepo_category(int repo_category) {
		this.repo_category = repo_category;
	}
	public int getCommu_num() {
		return commu_num;
	}
	public void setCommu_num(int commu_num) {
		this.commu_num = commu_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
}
