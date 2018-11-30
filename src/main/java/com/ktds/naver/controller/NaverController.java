package com.ktds.naver.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.naver.vo.ArticleVO;
import com.ktds.naver.vo.NaverVO;
import com.ktds.sns.vo.SnsVO;

@Controller
public class NaverController {
	
	@Value("${clientId}")
	private String clientId;	//애플리케이션 클라이언트 아이디값
	
	@Value("${clientSecret}")
	private String clientSecret;	//애플리케이션 클라이언트 시크릿값
	
	@GetMapping("/search/naver/{keyword}")
	@ResponseBody
	public List<SnsVO> doSearchNaverAction(@PathVariable String keyword) {

        List<SnsVO> list = new ArrayList<>();
        
        try {
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            JSONParser jsonParser = new JSONParser();
            JSONObject naverJson = (JSONObject) jsonParser.parse(response.toString());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            /*String convertDate = df.format(Date.parse(naverJson.get("lastBuildDate").toString()));
            NaverVO naverVO = new NaverVO();
            naverVO.setLastBuildDate(convertDate);
            naverVO.setTotal(Integer.parseInt(naverJson.get("total").toString()));
            naverVO.setStart(Integer.parseInt(naverJson.get("start").toString()));
            naverVO.setDisplay(Integer.parseInt(naverJson.get("display").toString()));*/
            
            JSONArray articleJson = (JSONArray) naverJson.get("items");
            for(int i=0; i<articleJson.size(); i++) {
            	JSONObject article = (JSONObject) articleJson.get(i);
            	ArticleVO articleVO = new ArticleVO();
            	articleVO.setTitle(article.get("title").toString());
            	articleVO.setOriginallink(article.get("originallink").toString());
            	articleVO.setLink(article.get("link").toString());
            	articleVO.setDescription(article.get("description").toString());
            	String convertDate = df.format(Date.parse(article.get("pubDate").toString()));
            	articleVO.setPubDate(convertDate);
            	SnsVO snsVO = new SnsVO(articleVO.getTitle(), articleVO.getLink(), articleVO.getDescription(), articleVO.getPubDate());
            	list.add(snsVO);
            }
            br.close();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
	}
}
