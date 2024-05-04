package com.shoppingcart_application.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingcart_application.dao.MerchantDao;
import com.shoppingcart_application.dto.Merchant;

@Controller
public class MerchantController {
	
	@Autowired
	MerchantDao dao ;
	
	@RequestMapping("/addmerchant")
	public ModelAndView addMerchant()
	{
		Merchant merchant = new Merchant() ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("merchantobj", merchant) ;
		mav.setViewName("merchantregister") ;
		
		return mav ;
	}
	
	@RequestMapping("/savemerchant")
	public ModelAndView saveMerchant(@ModelAttribute("merchantobj") Merchant merchant)
	{
		dao.saveMarchant(merchant) ;
		
		ModelAndView mav  = new ModelAndView() ;
		mav.addObject("msg", "Register Successfully..") ;
		mav.setViewName("merchantlogin") ;
		
		return mav ;
	}
	
	@RequestMapping("/merchantloginvalidate")
	public ModelAndView merchantLoginValidation(ServletRequest req, HttpSession session)
	{
		String email = req.getParameter("email") ;
		String password = req.getParameter("password") ;
		
		Merchant merchant = dao.findMarchantByEmailAndPassword(email, password) ;
		if(merchant != null)
		{
			ModelAndView mav = new ModelAndView() ;
			mav.addObject("msg", "Successfully Loged in") ;
			session.setAttribute("merchantinfo", merchant) ;
			mav.setViewName("merchantoptions") ;
			
			return mav ;
		}
		else
		{
			ModelAndView mav = new ModelAndView() ;
			mav.addObject("msg", "Invalid Credentials") ;
			mav.setViewName("merchantlogin") ;
			
			return mav ;
		}
	}
}
