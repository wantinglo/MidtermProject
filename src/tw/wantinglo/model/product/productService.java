package tw.wantinglo.model.product;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class productService {
	
		private productDAO pdao;
	@Autowired
		public productService(productDAO pdao) {
			this.pdao=pdao;
		}

		public boolean insert(Product pbean) throws SQLException {
			boolean result = pdao.insert(pbean);
			return result;
		}

		public List<Product> query_type(String p_type) {
			List<Product> list = pdao.query_type(p_type);
			return list;
		}

		public List<Product> query_name(String p_name) {
			List<Product> list = pdao.query_name(p_name);
			return list;
		}

		public List<Product> query_single(int p_id) {
			List<Product> list = pdao.query_single(p_id);
			return list;
		}
		
		
		public List<Product> query_data(String p_type,String p_name) {
			List<Product> list = pdao.query_data(p_type,p_name);
			return list;
		}


		public Product update(Product product) {
			pdao.update(product);
			return product;
		}

		public boolean delete(int p_id) {
			boolean result= pdao.delete(p_id);
			return result;
		}

		public List<Product> list() {
			return pdao.list();
		}


		public List<Product> phoneList() {
			return pdao.phoneList();
		}


		public List<Product> padList() {
			
			return pdao.padList();
		}


		public List<Product> macList() {
			return pdao.macList();
		}
	
		public Product getProduct(int p_id) {
		
			return pdao.getProduct(p_id);
		}

		public List<Product> getchangeprice(String p_name,String storage) {
			return pdao.getchangeprice(p_name,storage);
		}

		public List<Product> getchangeimg(String p_name, String color) {
			return pdao.getchangeimg(p_name,color);
		}


	}

