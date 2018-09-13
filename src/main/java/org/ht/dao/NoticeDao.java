package org.ht.dao;

import java.util.List;

import org.ht.pojo.Notice;

/**
 * 
 * @author zhouqi 2017年2月23日10:13:22 网站消息通告模块
 */
public interface NoticeDao {
	/**
	 * 查询网站通知表list
	 * 
	 * @return
	 */
	public List<Notice> noticelist(String ids);

	/**
	 * 查询网站通知表 通知详情
	 * 
	 * @return
	 */
	public Notice noticeget(Integer ids);

	/**
	 * 添加网站通知表 通知详情
	 * 
	 * @return
	 */
	public void noticeadd(Notice notice);

	/**
	 * 修改网站通知表 通知详情
	 * 
	 * @return
	 */
	public void noticeupd(Notice notice);
	
	
	public void noticeupds(Notice notice);

	public void noticshiji(Integer ids);
	/**
	 * 修改网站通知表 通知详情
	 * 
	 * @return
	 */
	public void noticedel(Integer ids);
	
	
	public List<Notice> noticetop5();
	
	public List<Notice> noticetop5meiti();
	
	public List<Notice> noticetop5sy();

}
