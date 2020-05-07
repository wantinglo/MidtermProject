package tw.wantinglo.model.member;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
;

@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class cabDAO {

	private SessionFactory sessionFactory;
	private Transaction transaction;

	@Autowired
	public cabDAO(@Qualifier(value = "sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;

	}

	public boolean insert(Cabinet cbean) throws SQLException {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(cbean);
			System.out.println("okkkk");
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	@SuppressWarnings("deprecation")
	public List<Cabinet> queryall(int memberid) {
		Session session = sessionFactory.getCurrentSession();
		// transaction = session.beginTransaction();
		Query<Cabinet> query = session.createQuery("from Cabinet where memberid=?0", Cabinet.class);
		query.setInteger(0, memberid);
		List<Cabinet> list = query.list();
		return list;
	}

	@SuppressWarnings("deprecation")
	public List<Cabinet> query(int foodid) {
		Session session = sessionFactory.getCurrentSession();
		Query<Cabinet> query = session.createQuery("from Cabinet where foodid=?0", Cabinet.class);
		query.setInteger(0, foodid);
		List<Cabinet> list = query.list();
		return list;
	}

	public Cabinet update(int foodid, String foodname, int count) {
		Session session = sessionFactory.getCurrentSession();
		Cabinet cb = session.get(Cabinet.class, foodid);
		try {
			if (cb != null) {
				cb.setFoodname(foodname);
				cb.setCount(count);
				session.update(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cb;
	}

	public boolean delete(int foodid) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("aaaa");
		Cabinet cb = session.get(Cabinet.class, foodid);
		boolean result = false;
		try {
			System.out.println("aaaa");
			if (cb != null) {
				session.delete(cb);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
