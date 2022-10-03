package com.uni.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class weather {
	public void getWeather(String[] args) {
        try{
            //서울시청의 위도와 경도
            String lon = "126.977948";  //경도
            String lat = "37.566386";   //위도

            //OpenAPI call하는 URL
            String urlstr = "http://api.openweathermap.org/data/2.5/weather?"
                        + "lat="+lat+"&lon="+lon
                        +"&appid=lyTc5jue6uCuQbBu1IHGEpNbReUOAdde8DGbldwTHNoIkHtSoBSazZlG%2FwKxSEk3QCzwahbcbGlX3dUYxxHmGA%3D%3D";
            URL url = new URL(urlstr);
            BufferedReader bf;
            String line;
            String result="";

            //날씨 정보를 받아온다.
            bf = new BufferedReader(new InputStreamReader(url.openStream()));

            //버퍼에 있는 정보를 문자열로 변환.
            while((line=bf.readLine())!=null){
                result=result.concat(line);
                //System.out.println(line);
            }

            //문자열을 JSON으로 파싱
            JsonParser jsonParser = new JsonParser();
            JsonObject jsonObj = (JsonObject) jsonParser.parse(result);

            //지역 출력
            System.out.println("지역 : " + jsonObj.get("name"));

            //날씨 출력
            JsonArray weatherArray = (JsonArray) jsonObj.get("weather");
            JsonObject obj = (JsonObject) weatherArray.get(0);
            System.out.println("날씨 : "+obj.get("main"));

            //온도 출력(절대온도라서 변환 필요)
            JsonObject mainArray = (JsonObject) jsonObj.get("main");
            double ktemp = Double.parseDouble(mainArray.get("temp").toString());
            double temp = ktemp-273.15;
            System.out.printf("온도 : %.2f\n",temp);

            bf.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
