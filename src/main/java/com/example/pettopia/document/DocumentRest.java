package com.example.pettopia.document;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;

@RestController
public class DocumentRest {
	
	@Autowired DocumentService documentService;
	
	@GetMapping("/divisionListByDocument")
	public List<Division> getDivisionListByDocument() {
		return documentService.getDivisionListByDocument();
	}
	
	@GetMapping("/deptListByDocument/{divisionCode}")
	public List<Department> getDeptListByDocument(@PathVariable String divisionCode) {
		return documentService.getDeptListByDocument(divisionCode);
	}
	
	@GetMapping("/empListByDocument/{deptCode}")
	public List<Map<String, Object>> getEmpListByDocument(@PathVariable String deptCode) {
		return documentService.getEmpListByDocument(deptCode);
	}
	
	@GetMapping("/getEmpSearchByDocument/{empName}")
	public List<Map<String, Object>> getEmpSearchByDocument(@PathVariable String empName) {
		return documentService.getEmpSearchByDocument(empName);
	}
	
	@GetMapping("/getDocumnetList")
	public List<Map<String, Object>> getDocumnetList(@RequestParam(required = false) String empNo, 
													 @RequestParam(required = false) String docType) {
		return documentService.getDocumnetList(empNo, docType);
	}
	
	
}
