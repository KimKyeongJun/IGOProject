package com.ktds.notice.dao;

import java.util.List;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;

public interface NoticeDao {

	public int insertNotice( NoticeVO noticeVO );
	/*public int updateNotice( NoticeVO noticeVO );*/
	public NoticeVO selectOneNotice( String noticeId );	
	public int deleteOneNotice( String noticeId );
	public int selectAllNoticesCount( NoticeSearchVO noticeSearchVO );
	public List<NoticeVO> selectAllNotices( NoticeSearchVO noticeSearchVO );
	public int modifyOneNotice(NoticeVO noticeVO);

}
