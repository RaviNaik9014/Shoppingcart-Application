package com.shoppingcart_application.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingcart_application.dto.Orders;

@Repository
public class OrdersDao {

	@Autowired
	EntityManagerFactory emf ;
	
	public void saveOrders (Orders order)
	{
		EntityManager em = emf.createEntityManager() ;
		EntityTransaction et = em.getTransaction() ;
		
		et.begin();
		em.persist(order);
		et.commit();
	}
	
	public Orders findOrdersById(int id)
	{
		EntityManager em = emf.createEntityManager() ;
		
		Orders order =em.find(Orders.class, id) ;
		
		return order ;
	}
	
	public void updateOrders( Orders order)
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction() ;
		
		et.begin();
		em.merge(order) ;
		et.commit();
	}
	
	public  void  deleteOrdersById(int id)
	{
		EntityManager em = emf.createEntityManager() ;
		EntityTransaction et = em.getTransaction() ;
		
		Orders order = em.find(Orders.class, id) ;
		
		et.begin();
		em.remove(order);
		et.commit();
	}
	
	public List<Orders> findAllOrderss()
	{
		EntityManager em = emf.createEntityManager() ;
		Query query = em.createQuery(" select p form Orders p") ;
		
		List<Orders> Orderss = query.getResultList() ;
		
		return Orderss ;
	}
	
	public List<Orders> findOrdersByBrand(String brand)
	{
		return null ;
	}
}
