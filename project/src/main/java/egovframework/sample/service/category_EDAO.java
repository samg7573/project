package egovframework.sample.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.Category_EVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("category_eRepository")
public class category_EDAO extends EgovAbstractMapper{

	public List<Category_EVO> selectAllCategory_EList(category_EDAO vo) throws Exception {
		return selectList("selectAllCategory_EList", vo);
	}
}

