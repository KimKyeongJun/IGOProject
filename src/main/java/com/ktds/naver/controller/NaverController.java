package com.ktds.naver.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.naver.vo.ArticleVO;
import com.ktds.naver.vo.NaverVO;

@Controller
public class NaverController {
	
	@GetMapping("/search/naver/{keyword}")
	public ModelAndView doSearchNaverAction(@PathVariable String keyword) {
		ModelAndView view = new ModelAndView("naver");
        try {
        	String clientId = "amL4JcIrkzw6Glbrtmbo";//애플리케이션 클라이언트 아이디값";
        	String clientSecret = "z6HjT8Q4Qk";//애플리케이션 클라이언트 시크릿값";
        	
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
            NaverVO naverVO = new NaverVO();
            naverVO.setLastBuildDate(naverJson.get("lastBuildDate").toString());
            naverVO.setTotal(Integer.parseInt(naverJson.get("total").toString()));
            naverVO.setStart(Integer.parseInt(naverJson.get("start").toString()));
            naverVO.setDisplay(Integer.parseInt(naverJson.get("display").toString()));
            
            List<ArticleVO> articleList = new ArrayList<>();
            JSONArray articleJson = (JSONArray) naverJson.get("items");
            for(int i=0; i<articleJson.size(); i++) {
            	JSONObject article = (JSONObject) articleJson.get(i);
            	ArticleVO articleVO = new ArticleVO();
            	articleVO.setTitle(article.get("title").toString());
            	articleVO.setOriginallink(article.get("originallink").toString());
            	articleVO.setLink(article.get("link").toString());
            	articleVO.setDescription(article.get("description").toString());
            	articleVO.setPubDate(article.get("pubDate").toString());
            	articleList.add(articleVO);
            }
            naverVO.setItems(articleList);
            br.close();
            view.addObject("naverVO", naverVO);
            view.addObject("keyword", keyword);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return view;
	}
}
