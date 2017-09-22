package com.project.kanemochi;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.kanemochi.dao.GPGK_DAO;

@Controller
public class GParkGkim {
	
	@Autowired
	private GPGK_DAO dao;

}
