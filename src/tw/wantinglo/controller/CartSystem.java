//package tw.wantinglo.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import tw.wantinglo.model.product.Product;
//import tw.wantinglo.model.product.productService;
//import tw.wantinglo.model.shopping.Cart;
//import tw.wantinglo.model.shopping.Cartitem;
//
//@Controller
//@SessionAttributes(names = {  })
//public class CartSystem {
//
//	private productService pservice;
//	@Autowired
//	public CartSystem(productService pservice){
//		this.pservice=pservice;
//	}
//	
//	public String addItemtoCart(HttpServletRequest request, HttpServletResponse response,Model model) {
//
//		//從session獲取購物車
//		Cart cart= (Cart) request.getSession().getAttribute("cart");
//		//如果獲取不到，創建新購物車對象，放在session中
//		if(null== cart) {
//		
//		cart = new Cart();
//		model.addAttribute("cart", cart);
//		//如果獲取到即可使用
//		}
//			//獲取到商品id和數量
//	
//			int p_id= Integer.parseInt(request.getParameter("p_id"));
//			int quantity= Integer.parseInt(request.getParameter("quentity"));
//			//通過商品id查詢商品對象
//			List<Product> product =pservice.query_single(p_id);
//		//獲取到待購買的購物項
//			Cartitem cartitem = new Cartitem();
//			cartitem.setQuantity(quantity);
//			cartitem.setProduct(product);
//			
//		//調用購物車上的方法
//			cart.addItemtoCart(cartitem);
//		//重新定向到/jsp/cart.jsp
//		
//		return "cart";
//		
//	}
//}
