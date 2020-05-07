package tw.wantinglo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.util.JSONPObject;

import tw.wantinglo.model.product.Product;
import tw.wantinglo.model.product.productService;



@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/productC")
public class ProductDetailController {
	String[] monitorlist = {"4.7", "5.5", "5.8", "6.1", "6.5", "10.2", 
			"10.5(Air)", "12.9", "13.3", "16", "Air"};
	String[] p_typelist= {"電腦","平板","手機"};
	String[] cpulist= {"A12Z","A12 Bionic+M12","A10 Fusion+M10","A9+M9","A8+M8","A7(1.3GHz雙核心)+M7","A6(1.3GHz雙核心)","A5(1GHz雙核心)"};
	String[] ramlist= {"4GB LPDDR4 DRAM","3GB LPDDR4 DRAM","2GB LPDDR4 DRAM","1GB LPDDR4 DRAM"};
	String[] storagelist= {"64GB","256GB","512GB","1TB"};
	String[] colorlist= {"香檳金","星鑽銀","太空灰"};
	@Autowired
	ServletContext context;
	
	@Autowired
	private productService pservice;

	@RequestMapping("")
	public String ProductClient() {
		return "redirect:/productC/phone";
	}
	

	@RequestMapping("/phone")
	public String ProductXPhone(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("--------/phone-----------");
		List<Product> rsproduct = new ArrayList<Product>();
		List<Product> listProduct = pservice.phoneList();
		if (listProduct != null && listProduct.size() > 0) {
			rsproduct.add(listProduct.get(0));
			for (int i = 0 ; i < listProduct.size() -1 ; i++) {
				if(listProduct.get(i).getP_name().equals(listProduct.get(i+1).getP_name())) {
					continue;
				}
				rsproduct.add(listProduct.get(i+1));
			}
		}

		System.out.println("list: " + rsproduct);
		request.setAttribute("listProduct", rsproduct);
		
		return "product-product";
	}

	@RequestMapping("/pad")
	public String ProductXPad(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("--------/pad-----------");
		List<Product> rsproduct = new ArrayList<Product>();
		List<Product> listProduct = pservice.padList();
		if (listProduct != null && listProduct.size() > 0) {
			rsproduct.add(listProduct.get(0));
			for (int i = 0 ; i < listProduct.size() -1 ; i++) {
				if(listProduct.get(i).getP_name().equals(listProduct.get(i+1).getP_name())) {
					continue;
				}
				rsproduct.add(listProduct.get(i+1));
			}
		}
		System.out.println("list: " + rsproduct);
		request.setAttribute("listProduct", rsproduct);
		return "product-product";
	}

	@RequestMapping("/mac")
	public String ProductXMac(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("--------/mac-----------");
		List<Product> rsproduct = new ArrayList<Product>();
		List<Product> listProduct = pservice.macList();
		if (listProduct != null && listProduct.size() > 0) {
			rsproduct.add(listProduct.get(0));
			for (int i = 0 ; i < listProduct.size() -1 ; i++) {
				if(listProduct.get(i).getP_name().equals(listProduct.get(i+1).getP_name())) {
					continue;
				}
				rsproduct.add(listProduct.get(i+1));
			}
		}

		System.out.println("list: " + rsproduct);
		request.setAttribute("listProduct", rsproduct);
		return "product-product";
	}

	@RequestMapping("/Detail")
	public String ProductDetail(HttpServletRequest request, HttpServletResponse response) {

		int p_id = Integer.parseInt(request.getParameter("p_id"));
		Product detail = pservice.getProduct(p_id);
		
		request.setAttribute("p_img", detail.getP_img() );
		request.setAttribute("p_name", detail.getP_name());
		request.setAttribute("p_type", detail.getP_type());
		request.setAttribute("ram", detail.getRam());
		request.setAttribute("des", detail.getDes());
		request.setAttribute("cpu", detail.getCpu());
		//---------------------------------------------------
		request.setAttribute("color", detail.getColor());	
		request.setAttribute("storage", detail.getStorage());
		request.setAttribute("price", detail.getPrice());
		request.setAttribute("discount", detail.getDiscount());	
		request.setAttribute("storagelist", storagelist);
		request.setAttribute("colorlist", colorlist);
//		List<Product> allbyname = productService.getallbyname(Detail.getP_name());
//		System.out.println("allbyname: " + allbyname);
		
		
		return "product-detail";

	}

	@RequestMapping("/cart")
	public String GotoCart() {
		return "cart";
	}
	@SuppressWarnings("resource")
	@RequestMapping("/getImage")
	protected void getImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InputStream input = null;
		OutputStream output = null;
		System.out.println("/getImage...........");
		String filename = request.getParameter("img");
		System.out.println("/getImage..........." + filename);
		
		String realPath = context.getRealPath("/WEB-INF/uploads");
		File file = new File(realPath + File.separator + filename);
		
		input = new FileInputStream(file);
		output = response.getOutputStream();
		response.setContentType("image/jpg");
		response.setContentLength((int)file.length());
		IOUtils.copy(input, output);
		
	}
	
	
	@RequestMapping("/changeprice")
	@ResponseBody
	public String changeprice(HttpServletRequest request,HttpServletResponse response) {
		String p_name= request.getParameter("p_name");
		String storage = request.getParameter("storage");
		
		JSONObject jo= new JSONObject();
		List<Product> list= pservice.getchangeprice(p_name, storage);
		
		System.out.println(list);
		int price=0;
		for (Product product:list) {
			price=  product.getPrice();
			break;
		}
		System.out.println(price);
		jo.put("price", price);

		return jo.toString();
}
	
	@RequestMapping("/changeimg")
	@ResponseBody
	public String changeimg(HttpServletRequest request,HttpServletResponse response) {

		
		String p_name= request.getParameter("p_name");
		String color = request.getParameter("color");
	System.out.println(color);
		JSONObject jo= new JSONObject();
		List<Product> list= pservice.getchangeimg(p_name, color);
		
		System.out.println(list);
		String image="";
		for (Product product:list) {
			 image=  product.getP_img();
			 System.out.println(image);
			break;
		}

		jo.put("p_img",image);
		System.out.println(image);
		return jo.toString();
}
	
	

}
