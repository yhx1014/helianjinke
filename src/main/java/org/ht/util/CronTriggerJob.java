package org.ht.util;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class CronTriggerJob extends QuartzJobBean{
	
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
	}

}
