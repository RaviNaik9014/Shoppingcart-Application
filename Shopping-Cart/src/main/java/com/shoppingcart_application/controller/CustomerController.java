package com.shoppingcart_application.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingcart_application.dao.CartDao;
import com.shoppingcart_application.dao.CustomerDao;
import com.shoppingcart_application.dao.MerchantDao;
import com.shoppingcart_application.dao.ProductDao;
import com.shoppingcart_application.dto.Cart;
import com.shoppingcart_application.dto.Customer;
import com.shoppingcart_application.dto.Merchant;
import com.shoppingcart_application.dto.Product;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerDao dao ;
	
	@Autowired
	CartDao cdao ;
	
	@Autowired
	ProductDao pdao ;
	
	@Autowired
	MerchantDao mdao;
	
	@RequestMapping("/addcustomer")
	public ModelAndView addCustomer()
	{
		Customer customer = new Customer() ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("customerobj", customer) ;
		mav.setViewName("customerform") ;
		return mav ;
	}
	
	@RequestMapping("/savecustomer")
	public ModelAndView saveCustomer(@ModelAttribute("customerobj") Customer customer)
	{
		Cart cart = new Cart() ;
		customer.setCart(cart) ;
		
		cdao.saveCart(cart) ;
		dao.saveCustomer(customer) ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("msg", "Registered  Successfully ...") ;
		mav.setViewName("customerlogin") ;
		return mav ;
	}
	
	@RequestMapping("/customerloginvalidate")
	public ModelAndView customerLoginValidation(ServletRequest req, HttpSession session)
	{
		String email = req.getParameter("email") ;
		String password = req.getParameter("password") ;
		
		Customer customer = dao.findCustomerEmailAndPassword(email, password) ;
		if(customer != null)
		{
			ModelAndView mav = new ModelAndView() ;
			session.setAttribute("customerinfo",customer) ;
			mav.setViewName("customeroptions") ;
			return mav ;
		}
		else
		{
			ModelAndView mav = new ModelAndView() ;
			mav.addObject("msg", "Invalide Credentials..") ;
			mav.setViewName("customerlogin") ;
			return mav ;
		}
	}
	
	@RequestMapping("/fetchallproducts")
	public ModelAndView fetchAllProducts()
	{
		List<Product> product = pdao.findAllProducts() ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("customerlistproducts", product) ;
		mav.setViewName("viewallproducts") ;
		return mav ;
	}
	
}
