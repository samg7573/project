package egovframework.sample.service;

import java.util.List;

public interface categoryService {

	List<Category_EVO> selectCategoryList(category_EDAO vo) throws Exception;
	
}
