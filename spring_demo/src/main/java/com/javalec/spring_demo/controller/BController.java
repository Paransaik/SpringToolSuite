package com.javalec.spring_demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_demo.command.BCommand;
import com.javalec.spring_demo.command.BContentCommand;
import com.javalec.spring_demo.command.BDeleteCommand;
import com.javalec.spring_demo.command.BListCommand;
import com.javalec.spring_demo.command.BModifyCommand;
import com.javalec.spring_demo.command.BReplyCommand;
import com.javalec.spring_demo.command.BReplyViewCommand;
import com.javalec.spring_demo.command.BWriteCommand;

@Controller
public class BController {

	BCommand command;
	
	@RequestMapping("/list")
	public String list(Model model) {
		System.out.println("list()");
		
		command = new BListCommand();
		command.execute(model);
		
		return "list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("write_view()");
		
		return "write_view";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		command = new BWriteCommand();
		command.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("content_view()");

		model.addAttribute("request", request);
		command = new BContentCommand();
		command.execute(model);
		
		return "content_view";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("modify()");

		model.addAttribute("request", request);
		command = new BModifyCommand();
		command.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("reply_view()");
		
		model.addAttribute("request", request);
		command = new BReplyViewCommand();
		command.execute(model);
		
		return "reply_view";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("reply()");
		
		model.addAttribute("request", request);
		command = new BReplyCommand();
		command.execute(model);
		
		return "redirect:list";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		
		model.addAttribute("request", request);
		command = new BDeleteCommand();
		command.execute(model);
		
		return "redirect:list";
	}
}
