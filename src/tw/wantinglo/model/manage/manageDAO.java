package tw.wantinglo.model.manage;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



@Repository
@Transactional(propagation = Propagation.REQUIRED )
public class manageDAO {
	private SessionFactory sessionFactory;
	//private Transaction transaction;

	@Autowired
	public manageDAO(@Qualifier(value = "sessionFactory") SessionFactory sessionFacotry) {
		this.sessionFactory = sessionFacotry;
	}
	

	public Manage isExist(Manage manage) {
		// transaction = session.beginTransaction();
		Session session = sessionFactory.getCurrentSession();
		Query<Manage> query = session.createQuery("from Manage where account=?0 and password=?1",
				Manage.class);
		Manage manage_check = new Manage();
		query.setParameter(0, manage.getAccount());
		query.setParameter(1, manage.getPassword());
		manage_check = query.uniqueResult();

		return manage_check;
	
	}
}
