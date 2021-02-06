package com.javalec.spring_demo.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.javalec.spring_demo.dao.BDao;
import com.javalec.spring_demo.dto.BDto;

public class BListCommand implements BCommand {

	//DB에서 가져온 정보를 화면에 뿌려줌
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		BDao dao = new BDao();
		ArrayList<BDto>dtos = dao.list();
		
		model.addAttribute("list", dtos);
	}

}
