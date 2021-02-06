package com.javalec.spring_demo.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class BContentCommand implements BCommand {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest resquest = (HttpServletRequest)map.get("request");
		
		//String bId = request.getParameter("bId");
		//BDao dao = new BDao();
		//BDto dto = dto.contentView(bId);
		
		//model.addAttribute("content_view", bdo);
		
	}

}
