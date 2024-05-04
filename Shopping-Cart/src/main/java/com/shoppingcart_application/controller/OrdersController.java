package com.shoppingcart_application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingcart_application.dao.CartDao;
import com.shoppingcart_application.dao.CustomerDao;
import com.shoppingcart_application.dao.OrdersDao;
import com.shoppingcart_application.dao.ProductDao;
import com.shoppingcart_application.dto.Cart;
import com.shoppingcart_application.dto.Customer;
import com.shoppingcart_application.dto.Items;
import com.shoppingcart_application.dto.Orders;
import com.shoppingcart_application.dto.Product;

@Controller
public class OrdersController {
	
	@Autowired
	OrdersDao dao ;
	
	@Autowired
	CustomerDao cdao ;
	
	@Autowired
	ProductDao pdao ;
	
	@Autowired
	CartDao cartdao ;
	
	@RequestMapping("/addorder")
	public ModelAndView addOrder()
	{
		Orders order = new Orders() ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("orderobj", order) ;
		mav.setViewName("orderform") ;
		return mav ;
	}
	
	@RequestMapping("/saveorder")
	public ModelAndView saveOrder(@ModelAttribute("orderobj") Orders order, HttpSession session) {
	    Customer customer = (Customer) session.getAttribute("customerinfo");
	    Customer customer1 = cdao.findCustomerById(customer.getId());
	    Cart cart = customer1.getCart();

	    List<Items> item = cart.getItems();
	    List<Items> itemlist = new ArrayList<Items>();

	    List<Items> itemswithquantity = new ArrayList<Items>();
	    for (Items i : item) {
	        Product p = pdao.findProductById(i.getId());
	        if (p != null && i.getQuantity() < p.getStock()) {
	            itemlist.add(i);
	            p.setStock(p.getStock() - i.getQuantity());
	            pdao.updateProduct(p);
	        } else {
	            itemswithquantity.add(i);
	        }
	    }
	    order.setItems(itemlist);
	    double totalpriceorder = 0;

	    for (Items i : itemlist) {
	        totalpriceorder = totalpriceorder + i.getPrice();
	    }
	    order.setTotalprice(totalpriceorder);

	    cart.setItems(itemswithquantity);
	    double totalprice = 0;

	    for (Items i : itemswithquantity) {
	        totalprice = totalprice + i.getPrice();
	    }
	    cart.setTotalprice(totalprice);

	    List<Orders> orders = customer.getOrders();
	    if (orders.size() > 0) {
	        orders.add(order);
	        customer.setOrders(orders);
	    } else {
	        List<Orders> orders1 = new ArrayList<Orders>();
	        orders1.add(order);
	        customer.setOrders(orders1);
	    }
	    customer.setCart(cart);
	    cartdao.updateCart(cart);
	    dao.saveOrders(order);
	    cdao.updateCustomer(customer1);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("msg", "Order Placed Successfully...");
	    mav.addObject("orderdetails", order);
	    mav.addObject("totalprice", cart.getTotalprice());
	    mav.setViewName("customerbill");

	    return mav;
	}

}
