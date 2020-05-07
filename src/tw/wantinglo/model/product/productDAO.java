package tw.wantinglo.model.product;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class productDAO {

	private SessionFactory sessionFactory;
	private Transaction transaction;

	@Autowired
	public productDAO(@Qualifier(value = "sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;

	}

	public boolean insert(Product pbean) throws SQLException {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(pbean);
			System.out.println("okkkk");
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
	
	public List<Product> query_type(String p_type) {
		Session session = sessionFactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where p_type=?0",Product.class);
		query.setParameter(0, p_type);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> query_name(String p_name) {
		Session session = sessionFactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where p_name=?0",Product.class);
		query.setParameter(0, p_name);
		List<Product> list = query.list();
		return list;
	}
	
	public List<Product> query_single(int p_id) {
		Session session = sessionFactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where p_id=?0",Product.class);
		query.setParameter(0, p_id);
		List<Product> list = query.list();
		return list;
	}
	
	public List<Product> query_data(String p_type, String p_name) {
		System.out.println("p_type>>>>>"+p_type);
		System.out.println("p_name>>>>>"+p_name);
		Session session = sessionFactory.getCurrentSession();
		String hql= "from Product p where p.p_type like :type and p.p_name like :name";
		Query<Product> query = session.createQuery(hql,Product.class);
		query.setParameter("type","%"+p_type+"%");
		query.setParameter("name","%"+p_name+"%");		
		List<Product> list = query.list();
		if(list!=null) {
			System.out.println("list is not null");
			
		}else {
			System.out.println("list is null");
		}
		return list;
	}
	
	public Product update(Product pbean) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(pbean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pbean;
	}

	public boolean delete(int p_id) {
		Session session = sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, p_id);
		boolean result = false;
		try {
			if (product != null) {
				session.delete(product);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Product> list() {
		@SuppressWarnings("unchecked")
		TypedQuery<Product> query = sessionFactory.getCurrentSession().createQuery("from Product");
		return query.getResultList();
	}
	
	
	@Transactional
	public List<Product> phoneList() {
		@SuppressWarnings("unchecked")
		TypedQuery<Product> query = sessionFactory.getCurrentSession().createQuery("from Product where p_type='手機'");
		return query.getResultList();
	}
	@Transactional
	public List<Product> padList() {
		@SuppressWarnings("unchecked")
		TypedQuery<Product> query = sessionFactory.getCurrentSession().createQuery("from Product where p_type='平板'");
		return query.getResultList();
	}
	@Transactional
	public List<Product> macList() {
		@SuppressWarnings("unchecked")
		TypedQuery<Product> query = sessionFactory.getCurrentSession().createQuery("from Product where p_type='電腦'");
		return query.getResultList();
	}
	@Transactional
	public Product getProduct(int p_id) {
		Product product = sessionFactory.getCurrentSession().get(Product.class, p_id);
		return product;

	}
	@Transactional
	public List<Product> getchangeprice(String p_name, String storage) {
		@SuppressWarnings("unchecked")
		TypedQuery<Product> query = sessionFactory.getCurrentSession().createQuery("from Product where (p_name='"+ p_name +"')and(storage='"+ storage +"')");
		return query.getResultList();
		}

	public List<Product> getchangeimg(String p_name, String color) {
		@SuppressWarnings("unchecked")
		TypedQuery<Product> query = sessionFactory.getCurrentSession().createQuery("from Product where (p_name='"+ p_name +"')and(color='"+ color +"')");
		return query.getResultList();
	}


	}

