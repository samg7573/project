package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("partMapper")
public interface PartMapper {
	
	List<String> getAllParts() throws Exception;

}
