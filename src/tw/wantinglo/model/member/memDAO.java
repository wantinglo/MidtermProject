package tw.wantinglo.model.member;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import tw.wantinglo.util.HibernateUtil;

@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class memDAO {
	private SessionFactory sessionFactory;
	private Transaction transaction;

	@Autowired
	public memDAO(@Qualifier(value = "sessionFactory") SessionFactory sessionFacotry) {
		this.sessionFactory = sessionFacotry;
		// Session session = sessionFacotry.getCurrentSession();
	}

	@SuppressWarnings("deprecation")
	public MemberBean isExist(MemberBean mb) {
		// transaction = session.beginTransaction();
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBean> query = session.createQuery("from MemberBean where account=?0 and password=?1",
				MemberBean.class);
		MemberBean MB = new MemberBean();
		query.setString(0, mb.getAccount());
		query.setString(1, mb.getPassword());
		MB = query.uniqueResult();

		return MB;
	}

	public boolean insert(MemberBean mb) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBean> query = session.createQuery("from MemberBean where account=?0 and phone=?1",
				MemberBean.class);
		boolean result= false;
		MemberBean MB = new MemberBean();
		query.setString(0, mb.getAccount());
		query.setString(1, mb.getPhone());
		MB = query.uniqueResult();
		if (MB == null) {
			session.save(mb);
			result=true;
		}
		return result;
	}
}

