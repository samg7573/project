package egovframework.sample.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("categoryMapper")
public interface CategoryMapper {
	
	String getIdByName(String categoryName) throws Exception;
	
}
