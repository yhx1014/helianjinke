package org.ht.spider;

import org.junit.Test;

import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

public class JsonRead {
	
	@Test
	public static void jsonRead(String s){
        try {
             
            JsonParser parser=new JsonParser();  //创建JSON解析器
            //new FileReader("test.json")
            JsonObject object=(JsonObject) parser.parse(s);  //创建JsonObject对象
           // System.out.println("cat="+object.get("cat").getAsString()); //将json数据转为为String型的数据
           // System.out.println("pop="+object.get("pop").getAsBoolean()); //将json数据转为为boolean型的数据
             
            JsonArray array=object.get("data").getAsJsonArray();    //得到为json的数组
            for(int i=0;i<array.size();i++){
                JsonObject subObject=array.get(i).getAsJsonObject();
                System.out.println("---------------");
                System.out.println("id="+subObject.get("id").getAsInt());
                System.out.println("name="+subObject.get("name").getAsString());
                System.out.println("symbol="+subObject.get("symbol").getAsString());
                System.out.println("website_slug="+subObject.get("website_slug").getAsString());
            }
             
        } catch (JsonIOException e) {
            e.printStackTrace();
        } catch (JsonSyntaxException e) {
            e.printStackTrace();
        }
    }
}
