package org.ht.util;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class SimpleTriggerJob extends QuartzJobBean{

	
	/**
	 *   这个类是每隔多少时间来执行的业务类。把你要执行的业务写在这里
	 * 
	 */
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
	}

}
