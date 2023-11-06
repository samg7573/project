package egovframework.sample.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.CategorybVO;

@Mapper("categorybMapper")
public interface CategorybMapper {
	
	CategorybVO getIdByName(String id) throws Exception;
	
}
