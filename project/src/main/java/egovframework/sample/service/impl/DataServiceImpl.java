package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.DataDAO;
import egovframework.sample.service.DataService;
import egovframework.sample.service.DataVO;
import egovframework.sample.service.PartDAO;
import egovframework.sample.service.PartService;

@Service("dataService")
public class DataServiceImpl extends EgovAbstractServiceImpl implements DataService, PartService{

	@Resource(name="datadaoMyBatis")
	private DataDAO dataDAO;
	
	@Resource(name="datadaoMyBatis")
	private PartDAO partDAO;
	
	@Resource(name="egovDataIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	public DataServiceImpl() {
		System.out.println("===> DataServiceImpl 생성자");
	}
	
	@Override
	public void insertData(DataVO vo) throws Exception {
		System.out.println("dataService -- Data 등록");
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		dataDAO.insertData(vo);
	}

	@Override
	public List<DataVO> getDataByPart(String part) throws Exception {
		System.out.println("dataService -- Data 파트별로 구분");
		return dataDAO.getDataByPart(part);
	}

	@Override
	public List<String> getAllParts() throws Exception {
		System.out.println("dataService -- 파트 목록 출력");
		return partDAO.getAllParts();
	}

	@Override
	public void updateData(DataVO vo) throws Exception {
		System.out.println("DataService -- Data 수정");
		dataDAO.updateData(vo);
		
	}

	@Override
	public void deleteData(DataVO vo) throws Exception {
		System.out.println("DataService -- Data 삭제");
		dataDAO.deleteData(vo);
	}

	@Override
	public DataVO selectData(String id) throws Exception {
		System.out.println("DataService -- Data 수정 불러오기");
		return dataDAO.selectData(id);
	}



}
