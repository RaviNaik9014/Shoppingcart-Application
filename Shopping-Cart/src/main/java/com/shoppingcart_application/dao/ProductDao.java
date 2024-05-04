package com.shoppingcart_application.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingcart_application.dto.Merchant;
import com.shoppingcart_application.dto.Product;

@Repository
public class ProductDao {

	@Autowired
	EntityManagerFactory emf ;
	
	@Autowired
	MerchantDao mdao ;
	
	public void saveProduct (Product product)
	{
		EntityManager em = emf.createEntityManager() ;
		EntityTransaction et = em.getTransaction() ;
		
		et.begin();
		em.persist(product);
		et.commit();
	}
	
	public Product findProductById(int id)
	{
		EntityManager em = emf.createEntityManager() ;
		
		Product product =em.find(Product.class, id) ;
		
		if(product != null) {
			return product ;
		}
		else
		{
			return null ;
		}
	}
	
	public void updateProduct( Product product)
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction() ;
		
		et.begin();
		em.merge(product) ;
		et.commit();
	}
	
	public  void  deleteProductById(int id)
	{
		EntityManager em = emf.createEntityManager() ;
		EntityTransaction et = em.getTransaction() ;
		
		Product product = em.find(Product.class, id) ;
		
		et.begin();
		em.remove(product);
		et.commit();
	}
	
	public List<Product> findAllProducts()
	{
		EntityManager em = emf.createEntityManager() ;
		Query query = em.createQuery(" select p from Product p") ;
		
		List<Product> products = query.getResultList() ;
		return products ;
	}
	
	public List<Product> findProductByBrand(String brand) 
	{
		EntityManager em = emf.createEntityManager() ;
		Query query = em.createQuery("select p from Product p where p.brand=?1") ;
		query.setParameter(1, brand ) ;
		return query.getResultList() ;
	}
	
	public List<Product> findProductByCategory(String category)
	{
		EntityManager em = emf.createEntityManager() ;
		Query query = em.createQuery("Select p from Product p where p.category=?1") ;
		query.setParameter(1,category) ;
		return query.getResultList() ;
	}
	public List<Product> findProductByPriceRange(Double minPrice, Double maxPrice)
	{
		EntityManager em = emf.createEntityManager() ;
		Query query = em.createQuery("SELECT p FROM Product p WHERE p.price BETWEEN :minPrice AND :maxPrice") ;
		query.setParameter("minPrice", minPrice) ;
		query.setParameter("maxPrice", maxPrice) ;
		return query.getResultList() ;
	}
	public Merchant revomeProductFromMerchant(int merchantId, int productId)
	{
		Merchant merchant = mdao.findMarchantById(merchantId) ;
		List<Product> products = merchant.getProduct() ;
		
		List<Product> productlist = new ArrayList<Product>() ;
		
		for(Product p : products)
		{
			if (p.getId() != productId)
			{
				productlist.add(p) ;
			}
		}
		
		merchant.setProduct(productlist);
		return  merchant ;
	}
}
