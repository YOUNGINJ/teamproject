package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IfaqDAO;
import com.ezen.dao.IonetooneDAO;
import com.ezen.dto.FaQ;
import com.ezen.dto.OneToOne;
import com.ezen.service.CustomerService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	IonetooneDAO onetooneDao;
	
	//고객센터 이동시 FAQ로 리다이렉트
	@RequestMapping("")
	public String customer() {
		return "redirect:customer/faq";
	}
	
	//자주묻는질문(FAQ List)(완)
	@RequestMapping("faq")
	public String faq(Model model, HttpServletRequest request) {
		
		ArrayList<FaQ> getFaqList = faqDao.getFaqList();
		model.addAttribute("getFaqList", getFaqList);
		
		return "customer/faq";
	}
	
	//FAQ 카테고리 선택
	@GetMapping("faqCatAction")
	public String faqCatAction(@RequestParam String faq_cat, Model model) {
		model = customerService.faqListByFaqCat(faq_cat, model);
		return "customer/faq";
	}
	
	//FAQ등록(완)
	@PostMapping("faqWriteAction")
	@ResponseBody
	public String faqWriteAction(@ModelAttribute FaQ Faq) {
		
		String result = customerService.FaqWrite(Faq);
		return result;
	}
	
	//FAQ 삭제(완)
	@RequestMapping("faqDeleteAction")
	@ResponseBody
	public String faqDeleteAction(@RequestParam("faq_idx") String faq_idx, HttpServletRequest reuqest) {
		
		int result = faqDao.faqDeleteByFaqIdx(faq_idx);
		if(result == 1) {
			System.out.println("삭제 성공");
			return "<script>alert('삭제 성공'); location.href='/customer/faq';</script>";
		}
		else {
			System.out.println("삭제 실패");
			return "<script>alert('삭제 실패'); location.href='/customer/faq';</script>";
		}
	}
	
	//내문의내역(myAsk List)
	//이건 전체 내역
	@RequestMapping("myAsk")
	public String myAsk() {
		
		return "customer/myAsk";
	}
	
	//내문의내역 카테고리 선택
	
	//문의하기 페이지(ask)
	@RequestMapping("ask")
	public String ask() {
		return "customer/ask";
	}
	
	//문의하기 액션
	@PostMapping("qnaQuestionAction")
	@ResponseBody
	public String qnaQuestionAction(@ModelAttribute OneToOne onetoone) {
		String result = customerService.insertOneToOne(onetoone);
		return result;
	}
}

