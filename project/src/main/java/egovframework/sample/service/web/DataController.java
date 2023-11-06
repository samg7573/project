package egovframework.sample.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.sample.service.BoardVO;
import egovframework.sample.service.DataService;
import egovframework.sample.service.DataVO;
import egovframework.sample.service.PartService;

@Controller
@SessionAttributes("data")
public class DataController {
	
	@Resource(name="dataService")
	private DataService dataService;
	
	@Resource(name="dataService")
	private PartService partService;
	
	@RequestMapping(value="/insertData.do", method = RequestMethod.GET)
	public String insertDataView(DataVO vo) throws Exception{
		System.out.println("링크 등록 화면으로 이동");
		return "insertData";
	}
	
	
	@RequestMapping(value = "/insertData.do", method=RequestMethod.POST)
	public String insertUser(DataVO vo, Model model) throws Exception  {
		dataService.insertData(vo);
		return "redirect:getAllParts.do";
	}
	
	@RequestMapping(value="/updateData.do", method = RequestMethod.GET)
	public String selectData(String id) throws Exception{
		System.out.println("링크 수정 화면으로 이동");
		return "updateData";
	}
	
	@RequestMapping(value="/updateData.do",method=RequestMethod.POST)
	public String updateBoard(@ModelAttribute("data")DataVO vo)throws Exception{
		System.out.println("데이터 수정");
		dataService.updateData(vo);
		return "redirect:getAllParts.do";
	}
	
	@RequestMapping("/deleteData.do")
	public String deleteData(DataVO vo) throws Exception{
		System.out.println("데이터 삭제");
		dataService.deleteData(vo);
		return "redirect:getAllParts.do";
	}
	
	
	@RequestMapping("/getDataList.do")
	public String getDataList(@RequestParam String part, Model model) throws Exception {
	    List<DataVO> dataList = dataService.getDataByPart(part);
	    model.addAttribute("dataList", dataList);
	    return "dataList";
	}
	
	@RequestMapping("/getAllParts.do")
	public String getAllParts(Model model) throws Exception{
	    System.out.println("파트별 구분 처리1");
	    List<String> partList = partService.getAllParts();
	    System.out.println("파트별 구분 처리2");
	    Map<String, List<DataVO>> dataMap = new HashMap<>();
	    for (String part : partList) {
	        System.out.println(part);
	        List<DataVO> dataList = dataService.getDataByPart(part);
	        dataMap.put(part, dataList);
	    }

	    model.addAttribute("dataMap", dataMap);
	    return "getDataByPart";
	}
	

	/*
	 * @RequestMapping(value ="/getAllParts.do") public String
	 * getDataByPart(List<String> partList, Model model) throws Exception {
	 * System.out.println("파트별 구분 처리2"); for (String part : partList) {
	 * System.out.println(part); List<DataVO> dataList =
	 * dataService.getDataByPart(part); model.addAttribute("dataList", dataList); }
	 * 
	 * return "getDataByPart"; }
	 */
}
