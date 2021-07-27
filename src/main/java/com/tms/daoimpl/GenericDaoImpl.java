package com.tms.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tms.dao.GenericDao;

@Repository
public class GenericDaoImpl<E> implements GenericDao<E> {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addEntity(E entity) {

		Session session = sessionFactory.openSession();
		System.out.println("DAO :" + entity);
		session.save(entity);
		System.out.println("SAVED SUCCESSFULLY");
		session.close();

	}

	@Override
	public void updateEntity(E entity) {

		Session session = sessionFactory.openSession();

		session.update(entity);

		session.flush();

		session.close();

	}

	@Override
	public void deleteEntity(Long id, Class clazz) {

		Session session = sessionFactory.openSession();

		Object object = session.load(clazz, id);

		session.delete(object);

		System.out.println("OBJECT DELETED SUCESSFULLY");

		session.flush();

		session.close();
	}

	@Override
	public List<E> findAll(Class clazz) {

		Session session = sessionFactory.openSession();

		List<E> entities = (List<E>) session.createCriteria(clazz).list();
		System.out.println("entities");
		session.close();

		return entities;
	}

	@Override
	public E findEntityById(Class clazz, Long id) {
		Session session = sessionFactory.openSession();
		Criteria criteria = (Criteria) session.createCriteria(clazz).add(Restrictions.idEq(id));
		E entity = null;
		if (criteria.list().size() > 0) {
			entity = (E) criteria.list().get(0);
		}
		session.close();
		return entity;

	}

}
