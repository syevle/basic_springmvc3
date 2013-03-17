package com.ked.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ked.pojo.Kernel;


@Repository
@Transactional
public abstract class GenericDAOImpl<K,T extends Kernel<K>> implements GenericDAO<K,T> {
	
	private static final Logger	LOGGER	= LoggerFactory.getLogger(GenericDAOImpl.class);
	
	protected Class<T>			entityClass;
	
	@Autowired
	protected SessionFactory sessionFactory;

	public GenericDAOImpl(Class<T> entityClass) {
		this.entityClass = entityClass;
		LOGGER.debug("BaseJpaDao(): instantiated DAO of type " + this.entityClass);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void persist(T entity) {
		LOGGER.debug("persist(): persisting entity " + entity);
		getSession().persist(entity);
		LOGGER.debug("persist(): persisted entity " + entity);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(T entity) {
		LOGGER.debug("remove(): removing entity " + entity);
		getSession().delete(entity);
		LOGGER.debug("remove(): removing entity " + entity);
	}

	public T findById(K id) {
		LOGGER.debug("findById(): using id " + id);
		if (id == null) {
			return null;
		}
		@SuppressWarnings("unchecked")
		T entity = (T) getSession().get(entityClass, (Serializable) id);
		LOGGER.debug("findById(): found entity => " + entity);
		return entity;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void merge(T entity) {
		LOGGER.debug("merge(): merging entity " + entity);
		getSession().merge(entity);
		LOGGER.debug("merge(): merged entity " + entity);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(){
		 LOGGER.debug("findAll(): finding All entity " + entityClass.getName());
	     Query query = getSession().createQuery("from " + entityClass.getName());
	     LOGGER.debug("findAll(): found All entity " + entityClass.getName());
	     return (List<T>) query.list();
	            
	}
	
	/**
	 * @see be.bzbit.framework.domain.repository.GenericRepository
         * #findByNamedQuery(java.lang.String, java.lang.Object[])
	 */
	@SuppressWarnings("unchecked")
	
	public List<T> findByNamedQuery(final String name, Object... params) {
		Query query = getSession().createQuery(name);

		for (int i = 0; i < params.length; i++) {
			query.setParameter(i + 1, params[i]);
		}

		final List<T> result = (List<T>) query.list();
		return result;
	}
	  /**
     * Gets the current session in use (creates one if necessary).
     * @return Session object 
     */
    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

}