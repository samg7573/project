package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.DataDAO;
import egovframework.sample.service.DataVO;
import egovframework.sample.service.PartDAO;

@Repository("datadaoMyBatis")
public class DataDAOMyBatis implements DataDAO, PartDAO{
	
	@Resource(name="dataMapper")
	private DataMapper mybatis;
	
	@Resource(name="partMapper")
	private PartMapper mybatis2;
	
	public DataDAOMyBatis() {
		System.out.println("===>DataDAOMyBatis 생성");
	}

	@Override
	public void insertData(DataVO vo) throws Exception {
		System.out.println("==>DataDAOMyBatis로 insertData() 기능 처리");
		mybatis.insertData(vo);

	}

	@Override
	public List<DataVO> getDataByPart(String part) throws Exception {
		System.out.println("==>DataDAOMyBatis로 getDataByPart() 기능 처리");
		return mybatis.getDataByPart(part);
	}

	@Override
	public List<String> getAllParts() throws Exception {
		System.out.println("==>DataDAOMyBatis로 getAllParts() 기능 처리");
		return mybatis2.getAllParts();
	}

	@Override
	public void updateData(DataVO vo) throws Exception {
		System.out.println("==>DataDAOMyBatis로 updateData() 기능 처리");
		mybatis.updateData(vo);
	}

	@Override
	public void deleteData(DataVO vo) throws Exception {
		System.out.println("==>DataDAOMyBatis로 deleteData() 기능 처리");
		mybatis.deleteData(vo);
	}

	@Override
	public DataVO selectData(String id) throws Exception {
		System.out.println("==>DataDAOMyBatis로 selectData() 기능 처리");
		return mybatis.selectData(id);
	}


}
