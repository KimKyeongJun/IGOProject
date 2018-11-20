package com.ktds.twitter.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.twitter.vo.TwitterVO;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

@Controller
public class TwitterController {
	
	public QueryResult getTwitterData(String searchKeyword) {
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
			.setOAuthConsumerKey("0N5Yc63DQ6u4w1LiHPJEEoKeZ")
			.setOAuthConsumerSecret("YTY1QwqLmdiWfKNdqFsAAomWAUxDpo8iFk3obaCjqDHJLaZR4b")
			.setOAuthAccessToken("1063292174236696576-ISr0oChBU5qhDdij1u49gPG3NFB1Xy")
			.setOAuthAccessTokenSecret("oi35iKbVJI7AUvBHD5YDOeDbjgwTgCVMh4tndGUbIrIDR");
		
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
	
	public List<TwitterVO> makeTwitterDataList(String searchKeyword){
		List<TwitterVO> twitterList = new ArrayList<TwitterVO>();
		QueryResult result = getTwitterData(searchKeyword);
		
		for (Status status : result.getTweets() ) {
			Date d = new Date();
			String date = null;
			
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
			TwitterVO twitterVO = new TwitterVO( "@"+status.getUser().getScreenName(),  date, status.getText() );
			twitterList.add(twitterVO);
		}
		return twitterList;
	}
	
	@GetMapping("/twitter/search/{searchKeyword}")
	public ModelAndView viewTwitterSearchPage(@PathVariable String searchKeyword) {
		ModelAndView view = new ModelAndView("search");
		List<TwitterVO> twitterList = makeTwitterDataList(searchKeyword);
		view.addObject("twitterList", twitterList);
		return view;
	}
	

}
