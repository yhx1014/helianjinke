package org.ht.util;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class Job1 extends QuartzJobBean{
	private int timeout;  
	private static int i = 0;  

	//调度工厂实例化后，经过timeout时间开始执行调度  

	public void setTimeout(int timeout) {  

	this.timeout = timeout;  

	}

	/** 

	* 要调度的具体任务 

	*/  
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		System.out.println("定时任务执行中…");  
	}  
	
}
