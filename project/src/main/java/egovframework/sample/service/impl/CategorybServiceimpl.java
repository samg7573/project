package egovframework.sample.service.impl;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.sample.service.CategorybDAO;
import egovframework.sample.service.CategorybService;
import egovframework.sample.service.CategorybVO;



@Service("categorybService")
public class CategorybServiceimpl extends EgovAbstractServiceImpl implements CategorybService{
	
	@Resource(name="categorybMyBatis")
	private CategorybDAO categorybDAO;
	
	
	public CategorybServiceimpl() {
		System.out.println("==>CategoryServiceimpl 생성");
	}
	
	public CategorybVO getIdByName(String id) throws Exception {
		return categorybDAO.getIdByName(id);
	}

	
	
}
