package egovframework.sample.service;

import java.util.List;

import egovframework.sample.service.DataVO;

public interface DataService {

	void insertData(DataVO vo) throws Exception;
	
	List<DataVO> getDataByPart(String part) throws Exception;

	void updateData(DataVO vo) throws Exception;

	void deleteData(DataVO vo) throws Exception;

	DataVO selectData(String id) throws Exception;
}
