package org.ht.service;

import java.util.List;

import org.ht.pojo.Notice;

public interface NoticeService {

	public List<Notice> noticelist(String ids);

	public Notice noticeget(Integer ids);

	public void noticeadd(Notice notice);

	public void noticeupd(Notice notice);

	public void noticedel(Integer ids);
	
	public void noticeupds(Notice notice);
	
	public void noticshiji(Integer ids);

	public List<Notice> noticetop5();
	public List<Notice> noticetop5meiti();
	public List<Notice> noticetop5sy();

	
}
