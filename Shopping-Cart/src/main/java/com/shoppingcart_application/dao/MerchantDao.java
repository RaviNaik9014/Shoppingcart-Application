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
public class MerchantDao {
	@Autowired
	EntityManagerFactory emf ;
	
	public void saveMarchant (Merchant merchant)
	{
		EntityManager em = emf.createEntityManager() ;
		EntityTransaction et = em.getTransaction() ;
		
		et.begin();
		em.persist(merchant);
		et.commit();
	}
	
	public Merchant findMarchantById(int id)
	{
		EntityManager em = emf.createEntityManager() ;
		
		Merchant merchant =em.find(Merchant.class, id) ;
		
		if (merchant != null)
			return merchant;
		else
			return null;
	}
	
	
	public void updateMarchant( Merchant merchant)
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction() ;
		
		et.begin();
		em.merge(merchant) ;
		et.commit();
	}
	
	public  void  deleteMarchantById(int id)
	{
		EntityManager em = emf.createEntityManager() ;
		EntityTransaction et = em.getTransaction() ;
		
		Merchant merchant = em.find(Merchant.class, id) ;
		
		et.begin();
		em.remove(merchant);
		et.commit();
	}
	
	public Merchant findMarchantByEmailAndPassword(String email, String password)
	{
		EntityManager em = emf.createEntityManager() ;
		Query query = em.createQuery("select m from Merchant m where m.email=?1 and m.password=?2 ");
		query.setParameter(1, email);
		query.setParameter(2, password);

		try
		{
			Merchant merchant = (Merchant) query.getSingleResult() ;
			return merchant ;
		}
		catch (NoResultException e)
		{
			return null ;
		}
	}
	public Merchant deleteProductFromMerchant(int merchant_id, int product_id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		Merchant merchant = em.find(Merchant.class, merchant_id);
		List<Product> products = merchant.getProduct();

		List<Product> productsList = new ArrayList<>();

		for (Product p : products) {
			
			if (p.getId() != product_id)
				productsList.add(p);
		}

		merchant.setProduct(productsList);
		return merchant;
	}
	
}
