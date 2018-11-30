package com.ktds.transport.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.transport.vo.BusVO;
import com.ktds.transport.vo.SubwayVO;

@Repository
public class TransportDaoImpl extends SqlSessionDaoSupport implements TransportDao {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public List<String> selectBusList() {
		return this.getSqlSession().selectList("TransportDao.selectBusList");
	}

	@Override
	public List<String> selectSubwayList() {
		return this.getSqlSession().selectList("TransportDao.selectSubwayList");
	}
}
