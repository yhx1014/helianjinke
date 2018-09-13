package org.ht.util;

import javax.websocket.Session;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.ShiroException;
import org.apache.shiro.subject.Subject;

public class WebUtils {

	/**
	 * 鑾峰彇褰撳墠鐧诲綍鍛樺伐
	 *
	 * @return
	 */
	// public static SessionUser getSessionUser() {
	// Subject currentUser = SecurityUtils.getSubject();
	// if (null != currentUser) {
	// Session session = currentUser.getSession(false);
	// return (SessionUser) session.getAttribute(AppConstants.SESSION_USER_KEY);
	// }
	// throw new ShiroException("sessionUser is null.");
	// }
	//
	// public static void setSessionUser(SessionUser sessionUser) {
	// Subject currentUser = SecurityUtils.getSubject();
	// if (null != currentUser) {
	// Session session = currentUser.getSession();
	// session.setAttribute(AppConstants.SESSION_USER_KEY, sessionUser);
	// } else {
	// throw new ShiroException("sessionUser is null.");
	// }
	// }

}
