
package org.ht.util;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.ht.pojo.Log;
import org.ht.pojo.Users;
import org.ht.service.LoggerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

/**
 * Name: LogUtils Description:日志组件 Create by: LiuXunming Date: 2016-3-29 Time:
 * 10:46
 */
public class LogUtils {
	private static Logger logger = LoggerFactory.getLogger(LogUtils.class);
	private static LoggerService logService = SpringContextHolder.getBean(LoggerService.class);

	public static HttpSession session;
	public static String globaluser = session.getAttribute("globaluser").toString();

	/**
	 * 记录操作日志
	 *
	 * @param label
	 *            标签
	 * @param name
	 *            操作对象名称
	 * @param lremarks
	 *            具体信息
	 */
	public static void log(String label, String name, String[] lremarks) {
		if (lremarks != null) {
			for (String lremark : lremarks) {
				log(label, name, lremark);
			}
		}
	}

	/**
	 * 记录操作日志
	 *
	 * @param label
	 *            标签
	 * @param name
	 *            操作对象类型 如：新增用户，修改用户
	 * @param lremark
	 *            具体信息
	 */
	public static void log(String label, String logtype, String lremark) {
		logger.debug("---------------------" + label + "," + logtype + ":" + lremark + "-----------------------");

		Log log = new Log();
		log.setLaccount(globaluser.toString());
		log.setLogtype(logtype);
		log.setLprocesstime(new Date());
		log.setLremark(lremark);

		log.setLremark(StringUtils.isEmpty(label) ? label : (lremark + ":" + lremark));

		// logService.create(log);

	}

	/**
	 * 记录登录退出日志
	 *
	 * @param label
	 *            标签
	 * @param account
	 *            操作对象名称
	 * @param vp
	 *            虚拟路径
	 * @param ip
	 *            ip
	 */
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