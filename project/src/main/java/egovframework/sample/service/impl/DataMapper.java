package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.DataVO;

@Mapper("dataMapper")
public interface DataMapper {

	void insertData(DataVO vo) throws Exception;
	
	List<DataVO> getDataByPart(String part) throws Exception;

	void updateData(DataVO vo) throws Exception;

	void deleteData(DataVO vo) throws Exception;

	DataVO selectData(String id) throws Exception;


}
