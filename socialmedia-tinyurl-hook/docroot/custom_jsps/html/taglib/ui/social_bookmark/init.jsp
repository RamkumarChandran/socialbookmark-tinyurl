<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/taglib/init.jsp" %>
<%@ page import="rcs.ext.socialmedia.utils.TinyUrlUtil"  %>

<%

String tinyUrlProperty = PrefsPropsUtil.getString("rcs.hooks.socialmedia.tinyurl.enabled");
boolean tinyUrlEnabled = false;
if(tinyUrlProperty!=null) {
	if(tinyUrlProperty.equals("true")) {
		tinyUrlEnabled = true;
	}
}

String displayStyle = GetterUtil.getString((String)request.getAttribute("liferay-ui:social-bookmark:displayStyle"), "horizontal");
String type = (String)request.getAttribute("liferay-ui:social-bookmark:type");
String url = GetterUtil.getString((String)request.getAttribute("liferay-ui:social-bookmark:url"));
String title = GetterUtil.getString((String)request.getAttribute("liferay-ui:social-bookmark:title"));
String target = GetterUtil.getString((String)request.getAttribute("liferay-ui:social-bookmark:target"));
String postUrl = (String)request.getAttribute("liferay-ui:social-bookmark:postUrl");

if(tinyUrlEnabled) {
	url = rcs.ext.socialmedia.utils.TinyUrlUtil.getTinyUrl(url);
	postUrl = url;
} 

String messageKey = "social-bookmark-" + type;

%>


