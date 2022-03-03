package com.ezen.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.service.FileService;

@Controller
public class MainController {
	
	@Autowired
	FileService fileService;

	@RequestMapping("")
	public String root() {
		return "redirect:main";
	}
	
	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
//		int cartBedgeNum = session.getAttribute(String(cart));	
//		model.addAttribute("cartBedgeNum", cartBedgeNum);
		return "main";
	}
	
	@PostMapping("fileuploadetest")
	@ResponseBody
	public String testing(@RequestParam("filetest") MultipartFile file) {
	
		String filelocation = fileService.fileUploader("thumb", file);
		System.out.println(filelocation);
		if(filelocation.charAt(0) == 'f') {
			return "script:alert('파일업로드에 실패하였습니다.'); location.href='main'";     
		}
		return "script: location.href='main'";
	}
}
