package egovframework.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.CategorybDAO;
import egovframework.sample.service.CategorybVO;



@Repository("categorybMyBatis")
public class CategorybDAOMyBatis implements CategorybDAO{
	
	@Resource(name="categorybMapper")
	private CategorybMapper mybatis;
	
	
	public CategorybDAOMyBatis() {
		System.out.println("==>CategoryMyBatis 생성");
	}
	
	public CategorybVO getIdByName(String id) throws Exception {
		return mybatis.getIdByName(id);
	}

	
	
}
