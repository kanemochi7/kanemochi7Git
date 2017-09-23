package com.project.kanemochi;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.kanemochi.dao.GP_DAO;


@Controller
public class GPark {
	
	@Autowired
	private GP_DAO dao;
	

}
