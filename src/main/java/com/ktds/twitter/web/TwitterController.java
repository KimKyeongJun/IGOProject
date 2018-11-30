package com.ktds.twitter.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.sns.vo.SnsVO;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.URLEntity;
import twitter4j.conf.ConfigurationBuilder;

@Controller
public class TwitterController {
	
	@Value("${OAuthConsumerKey}")
	private String oAuthConsumerKey;
	
	@Value("${OAuthConsumerSecret}")
	private String oAuthConsumerSecret;
	
	@Value("${OAuthAccessToken}")
	private String oAuthAccessToken;
	
	@Value("${OAuthAccessTokenSecret}")
	private String oAuthAccessTokenSecret;
	
	// Twitter에서 검색 결과를 가져오기
	public QueryResult getTwitterData(String searchKeyword) {
		
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
			.setOAuthConsumerKey(oAuthConsumerKey)
			.setOAuthConsumerSecret(oAuthConsumerSecret)
			.setOAuthAccessToken(oAuthAccessToken)
			.setOAuthAccessTokenSecret(oAuthAccessTokenSecret);
		
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();
		QueryResult result = null;
		Query query = new Query(searchKeyword);
		try {
			result = twitter.search(query);
		} catch (TwitterException e) {
		}
		return result;
	}
	
	// Twitter에서  가져온 데이터를 원하는 내용만 뽑아서 VO에 적재
	public List<SnsVO> makeTwitterDataList(String searchKeyword){
		List<SnsVO> twitterList = new ArrayList<SnsVO>();
		QueryResult result = getTwitterData(searchKeyword);
		
		for ( Status status : result.getTweets() ) {
			Date d = new Date();
			String date = null;
			
			URLEntity[] urls = status.getURLEntities();
			String url = null;
			
			for(URLEntity urlEntity : urls) {
				url = urlEntity.getURL();
			}
			
			long seconds = d.getTime()-status.getCreatedAt().getTime();
			
			if ( seconds < 60000 ) {
				seconds = seconds / 1000;
				date = seconds + "초 전";
			}
			else if ( seconds < 3600000 ) {
				seconds = seconds / 60000;
				date = seconds + "분 전";
			}
			else if ( seconds < 86400000 ) {
				seconds = seconds / 3600000;
				date = seconds + "시간 전";
			}
			else if ( seconds < 2592000000L ) {
				seconds = seconds / 86400000;
				date = seconds + "일 전";
			}
			else {
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String convertDate = transFormat.format(status.getCreatedAt());
				date = convertDate;
			}
			SnsVO snsVO = new SnsVO( "@"+status.getUser().getScreenName(), url, status.getText(), date );
			twitterList.add(snsVO);
		}
		return twitterList;
	}
	
	@PostMapping("/search/twitter")
	@ResponseBody
	public List<SnsVO> viewTwitterSearchPage(@RequestParam String searchKeyword) {
		List<SnsVO> twitterList = makeTwitterDataList(searchKeyword);
		return twitterList;
	}

}
