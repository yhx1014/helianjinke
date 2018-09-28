package org.ht.util;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class Job1 extends QuartzJobBean{
	public int timeout;  
	public void setTimeout(int timeout) {  
		this.timeout = timeout;  
	}
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
	}  
	
}
