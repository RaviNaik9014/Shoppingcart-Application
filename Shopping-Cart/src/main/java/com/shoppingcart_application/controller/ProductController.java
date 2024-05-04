package com.shoppingcart_application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingcart_application.dao.MerchantDao;
import com.shoppingcart_application.dao.ProductDao;
import com.shoppingcart_application.dto.Merchant;
import com.shoppingcart_application.dto.Product;

import net.bytebuddy.matcher.ModifierMatcher.Mode;

@Controller
public class ProductController {

	@Autowired
	ProductDao dao ;
	
	@Autowired
	MerchantDao mdao ;
	
	@RequestMapping("/addproduct")
	public ModelAndView addProduct()
	{
		Product product = new Product() ;
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("productobj", product) ;
		mav.setViewName("productform") ;
		
		return mav ;
	}
	
	@RequestMapping("/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute("productobj") Product p, HttpSession session) {
		Merchant merchant = (Merchant) session.getAttribute("merchantinfo");
		List<Product> products = merchant.getProduct();
		if (products.size() > 0) {
			products.add(p);
			merchant.setProduct(products);
		} else {
			List<Product> productslist = new ArrayList<Product>();
			productslist.add(p);

			merchant.setProduct(productslist);
		}

		dao.saveProduct(p);
		mdao.updateMarchant(merchant);

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "Data saved successfully");
		mav.setViewName("merchantoptions");
		return mav;
	}

	
	@RequestMapping("/viewallproducts")
	public ModelAndView viewAllProduct(HttpSession session)
	{
		Merchant merchant = (Merchant)session.getAttribute("merchantinfo") ;
		Merchant merchant1 = mdao.findMarchantById(merchant.getId()) ;
		
		List<Product> product = merchant.getProduct() ;
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("productlist", product) ;
		mav.setViewName("displayallproducts") ; 
		return mav ;
	}
	
	@RequestMapping("/deleteproduct")
	public ModelAndView deleteProduct(@RequestParam("id") int id, HttpSession session) {
		Merchant merchant = (Merchant) session.getAttribute("merchantinfo");
		Merchant m = mdao.deleteProductFromMerchant(merchant.getId(), id);

		mdao.updateMarchant(m);
		dao.deleteProductById(id);

		session.setAttribute("merchantinfo", m);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/viewallproducts");
		return mav;
	}
	
	@RequestMapping("/updateproduct")
	public ModelAndView updateProduct(@RequestParam("id") int productId, HttpSession session) {
		Merchant merchant = (Merchant) session.getAttribute("merchantinfo");
	    // Retrieve the product from the database
	    Product product = dao.findProductById(productId);
	    mdao.updateMarchant(merchant) ;
	    // Check if the product exists
	    if (product == null) {
	        // If the product does not exist, redirect to an error page or display an error message
	        ModelAndView errorModel = new ModelAndView("error");
	        errorModel.addObject("errorMessage", "Product not found");
	        return errorModel;
	    }

	    // Pass the product to the view for editing
	    ModelAndView mav = new ModelAndView("updateproducts");
	    mav.addObject("updateproductlist", product);
	    return mav;
	}

	@RequestMapping("/viewupdatelist")
	public ModelAndView viewUpdateProduct(@ModelAttribute("updateproductlist") Product product) {
	    // Update the product in the database
	    dao.updateProduct(product);
	    // Redirect to the view all products page
	    ModelAndView mav = new ModelAndView() ;
	    mav.addObject("msg", "Updated Data successfully") ;
	    mav.setViewName("redirect:/viewallproducts");
	    return mav;
	}
	
	@RequestMapping("/viewproductsbybrand")
	public ModelAndView viewProductByBrand(@RequestParam("brand") String brand, HttpSession session) {
		Merchant marchant = (Merchant) session.getAttribute("merchantinfo");
	    List<Product> products = dao.findProductByBrand(brand);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("brandlist", products);
	    mav.setViewName("viewbybrand");
	    return mav;
	}
	
	@RequestMapping("/viewproductsbycategory")
	public ModelAndView viewProductByCategory(@RequestParam("category") String category, HttpSession session)
	{
		Merchant merchant = (Merchant) session.getAttribute("merchantinfo");
		List<Product> products = dao.findProductByCategory(category);
		
		ModelAndView mav = new ModelAndView() ;
		mav.addObject("categorylist", products) ;
		mav.setViewName("viewbycategory") ;
		return mav; 
	}
	
	@RequestMapping("/viewproductspricerange")
	public ModelAndView viewProductByPrice(@RequestParam("minPrice") double minPrice,@RequestParam("maxPrice") double maxPrice, HttpSession session)
	{
		//Merchant merchant = (Merchant) session.getAttribute("merchantinfo") ;
		List<Product> products = dao.findProductByPriceRange(minPrice,maxPrice) ;
		
		ModelAndView mav = new ModelAndView()  ;
		mav.addObject("pricelist", products) ;
		mav.setViewName("viewbyprice") ;
		return mav;
	}
}
