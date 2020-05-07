package tw.wantinglo.model.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import tw.wantinglo.util.HibernateUtil;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class cabService {

	private cabDAO cdao;
	@Autowired
	public cabService(cabDAO cdao) {
		this.cdao = cdao;
	}

	public List<Cabinet> queryall(int memberid) {
		List<Cabinet> list = cdao.queryall(memberid);
		return list;

	}

	public boolean insert(Cabinet cbean) throws SQLException {
		boolean result = cdao.insert(cbean);
		return result;
	}

	public List<Cabinet> query(int foodid) {
		List<Cabinet> list = cdao.query(foodid);
		return list;
	}

	public Cabinet update(int foodid, String foodname, int count) {
		Cabinet cb = cdao.update(foodid, foodname, count);
		return cb;
	}

	public boolean delete(int foodid) {
		boolean result = cdao.delete(foodid);
		return result;
	}

}
