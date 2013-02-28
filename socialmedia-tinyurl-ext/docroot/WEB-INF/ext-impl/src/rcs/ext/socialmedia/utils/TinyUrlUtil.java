package rcs.ext.socialmedia.utils;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;

public class TinyUrlUtil {

		private final static int TIMEOUT = 1000;
	
		public static String getTinyUrl(String fullUrl) {
			HttpClient httpclient = new HttpClient();
			httpclient.setConnectionTimeout(TIMEOUT);
			httpclient.setTimeout(TIMEOUT);
			HttpMethod method = new GetMethod("http://tinyurl.com/api-create.php"); 
			method.setQueryString(new NameValuePair[]{new NameValuePair("url",fullUrl)});
			String tinyUrl = fullUrl;
			
			try {
				httpclient.executeMethod(method);
				tinyUrl = method.getResponseBodyAsString();
				method.releaseConnection();
			} catch (HttpException e) {
				method.releaseConnection();
				// implement Liferay logging service 
			} catch (IOException e) {
				method.releaseConnection();
				// implement Liferay logging service 
			} catch (Exception e) {
				method.releaseConnection();
				// implement Liferay logging service
			}
				
			return tinyUrl;
		}
		
}
