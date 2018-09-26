package org.ht.dao;

import java.util.List;
import org.ht.pojo.Notice;

public interface NoticeDao {
	
	public List<Notice> noticelist(String ids);
	public Notice noticeget(Integer ids);
	public void noticeadd(Notice notice);
	public void noticeupd(Notice notice);
	public void noticeupds(Notice notice);
	public void noticshiji(Integer ids);
	public void noticedel(Integer ids);
	public List<Notice> noticetop5();
	public List<Notice> noticetop5meiti();
	public List<Notice> noticetop5sy();

}
