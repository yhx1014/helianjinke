
package org.ht.util;

import java.util.Date;
import javax.servlet.http.HttpSession;
import org.ht.pojo.Log;
import org.ht.service.LoggerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

public class LogUtils {
	private static Logger logger = LoggerFactory.getLogger(LogUtils.class);
	private static LoggerService logService = SpringContextHolder.getBean(LoggerService.class);

	public static HttpSession session;
	public static String globaluser = session.getAttribute("globaluser").toString();
	public static void log(String label, String name, String[] lremarks) {
		if (lremarks != null) {
			for (String lremark : lremarks) {
				log(label, name, lremark);
			}
		}
	}

	public static void log(String label, String logtype, String lremark) {
		logger.debug("---------------------" + label + "," + logtype + ":" + lremark + "-----------------------");

		Log log = new Log();
		log.setLaccount(globaluser.toString());
		log.setLogtype(logtype);
		log.setLprocesstime(new Date());
		log.setLremark(lremark);

		log.setLremark(StringUtils.isEmpty(label) ? label : (lremark + ":" + lremark));


	}

	public static void loginLog(String account, String logtype, String lremark) {
		logger.debug("---------------------" + logtype + "," + account + "-----------------------");

		Log log = new Log();
		log.setLaccount(account);
		log.setLogtype(logtype);
		log.setLremark(lremark);
		log.setLprocestime(new Date());
		logService.create(log);
	}
}