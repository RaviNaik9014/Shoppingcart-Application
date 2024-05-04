package com.shoppingcart_application.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingcart_application.dto.Cart;
import com.shoppingcart_application.dto.Customer;
import com.shoppingcart_application.dto.Items;

@Controller
public class CartController {
	
	@RequestMapping("/fetchitemsfromcart")
	public ModelAndView fetchItemsFromCart(HttpSession session)
	{
		Customer customer = (Customer) session.getAttribute("customerinfo") ;
		Cart cart = customer.getCart() ;
		List<Items> items = cart.getItems() ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("itemslist", items) ;
		mav.addObject("totalprice", cart.getTotalprice()) ;
		mav.setViewName("displayallitems") ;
		return mav ;
	}
}
