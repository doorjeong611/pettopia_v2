package com.example.pettopia.documentfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DocumentFileService {
	
	@Autowired DocumentFileMapper documentFileMapper;

}
