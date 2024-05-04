package com.shoppingcart_application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingcart_application.dao.CartDao;
import com.shoppingcart_application.dao.CustomerDao;
import com.shoppingcart_application.dao.ItemsDao;
import com.shoppingcart_application.dao.ProductDao;
import com.shoppingcart_application.dto.Cart;
import com.shoppingcart_application.dto.Customer;
import com.shoppingcart_application.dto.Items;
import com.shoppingcart_application.dto.Product;

@Controller
public class ItemController {
	
	@Autowired
	ProductDao pdao ;
	
	@Autowired
	ItemsDao idao ;
	
	@Autowired
	CartDao cdao ;
	
	@Autowired
	CustomerDao custdao ;
	
	@RequestMapping("/additem")
	public ModelAndView addItem(@RequestParam("id") int productid) {
		Product p = pdao.findProductById(productid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("prodobj", p);
		mav.setViewName("itemform");
		return mav;
	}

	
	@RequestMapping("/additemtocart")
	public ModelAndView addItemToCart(ServletRequest req, HttpSession session) {
		int productid = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name") ;
		String brand = req.getParameter("brand");
		double price = Double.parseDouble(req.getParameter("price"));
		String model = req.getParameter("model");
		String category = req.getParameter("category");
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		Items item = new Items();
		item.setName(name) ;
		item.setBrand(brand);
		item.setCategory(category);
		item.setQuantity(quantity);
		item.setProductId(productid);
		item.setPrice(quantity * price);

		Customer customer = (Customer) session.getAttribute("customerinfo");
		Cart c = customer.getCart();

		if (c == null) {

			Cart cart = new Cart();

			List<Items> items = new ArrayList<>();
			items.add(item);

			cart.setItems(items);
			cart.setName(customer.getName());

			cart.setTotalprice(item.getPrice());

			customer.setCart(cart);

			idao.saveItem(item);
			cdao.saveCart(cart);

			custdao.updateCustomer(customer);

		} else {
			List<Items> items = c.getItems();
			if (items.size() > 0) {
				items.add(item);
				c.setItems(items);
				double totalprice = 0;
				for (Items i : items)
					totalprice = totalprice + i.getPrice();
				c.setTotalprice(totalprice);
				customer.setCart(c);

				idao.saveItem(item);
				cdao.updateCart(c);
				custdao.updateCustomer(customer);

			} else {
				List<Items> itemslist = new ArrayList<>();
				itemslist.add(item);
				c.setItems(itemslist);
				c.setTotalprice(item.getPrice());

				idao.saveItem(item);
				cdao.updateCart(c);
				custdao.updateCustomer(customer);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/fetchitemsfromcart");
		return mav;
	}


}
