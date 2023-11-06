package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.sample.service.Category_EVO;
import egovframework.sample.service.categoryService;
import egovframework.sample.service.category_EDAO;

@Service("category_eService")
public class category_eServiceImpl extends EgovAbstractServiceImpl implements categoryService {

	@Resource(name = "category_eRepository")
	private category_EDAO edao;
	
	@Override
	public List<Category_EVO> selectCategoryList(category_EDAO vo) throws Exception {
		List<Category_EVO> result = edao.selectAllCategory_EList(vo);
		
		return result;
	}
}
