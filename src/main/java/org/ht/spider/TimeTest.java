package org.ht.spider;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Timer;
import java.util.TimerTask;

//
public class TimeTest {
	public void requestWebsit()
	{
		JsonRead jr = new JsonRead();
        TimerTask task = new TimerTask() {  
            @Override  
            public void run() {  
       		 	String s = TimeTest.sendGet("https://api.coinmarketcap.com/v2/listings/", null);
       		 	JsonRead.jsonRead(s);
            }  
        };  
        Timer timer = new Timer();  
        long delay = 0;  
        long intevalPeriod = 1 * 1000;  
        timer.scheduleAtFixedRate(task, delay, intevalPeriod); 
		
	}
	public static void main(String[] args) {  
		TimeTest tt = new TimeTest();
		tt.requestWebsit();
    }
	
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            URLConnection connection = realUrl.openConnection();
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.connect();
            //Map<String, List<String>> map = connection.getHeaderFields();
            //            for (String key : map.keySet()) {
            //                System.out.println(key + "--->" + map.get(key));
            //            }
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
        	System.out.println(e);
            e.printStackTrace();
        }
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
}
