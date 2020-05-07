package tw.wantinglo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.wantinglo.model.manage.Manage;
import tw.wantinglo.model.manage.manageService;

import tw.wantinglo.model.product.Product;
import tw.wantinglo.model.product.productService;

@Controller
@SessionAttributes(names = { "MLoginOK", "p_id", "p_type", "p_name", "type_items", "name_items", "single_items",
		"storagelist" })
public class ProductSystem {

	String[] monitorlist = { "4.7", "5.5", "5.8", "6.1", "6.5", "10.2", "10.5(Air)", "12.9", "13.3", "16", "Air" };
	String[] p_typelist = { "電腦", "平板", "手機" };
	String[] cpulist = { "A12Z", "A12 Bionic+M12", "A10 Fusion+M10", "A9+M9", "A8+M8", "A7(1.3GHz雙核心)+M7",
			"A6(1.3GHz雙核心)", "A5(1GHz雙核心)" };
	String[] ramlist = { "4GB LPDDR4 DRAM", "3GB LPDDR4 DRAM", "2GB LPDDR4 DRAM", "1GB LPDDR4 DRAM" };
	String[] storagelist = { "64GB", "256GB", "512GB", "1TB" };
	String[] colorlist = { "red", "pink", "white", "black", "yellow" };

	private productService pservice;
	private manageService mservice;
	ServletContext context;

	@Autowired
	public ProductSystem(productService pservice, manageService mservice, ServletContext context) {
		this.pservice = pservice;
		this.mservice = mservice;
		this.context = context;
	}

	@RequestMapping("/add")
	protected String addProductPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("monitorlist", monitorlist);
		request.setAttribute("p_typelist", p_typelist);
		request.setAttribute("cpulist", cpulist);
		request.setAttribute("ramlist", ramlist);
		request.setAttribute("storagelist", storagelist);
		request.setAttribute("colorlist", colorlist);
		return "product-form";
	}

	@RequestMapping(value = "/productmanage.controller")
	public String ActionManage() {
		return "Manage_login";
	}

	@RequestMapping(value = "/managelogin.controller")
	public String ProcessLogin(@RequestParam("acc") String account, @RequestParam("pwd") String password, Model model) {
		Map<String, String> nullMsgMap = new HashMap<String, String>();
		model.addAttribute("nullMsgKey", nullMsgMap);

		if (account == null || account.length() == 0) {
			nullMsgMap.put("AccountEmptyError", "帳號不可空白");
		}

		if (password == null || password.length() == 0) {
			nullMsgMap.put("PasswordEmptyError", "密碼不可空白");
		}

		if (!nullMsgMap.isEmpty()) {
			return "Login";
		}

		System.out.println(">>>>>>" + account);
		System.out.println(">>>>>>" + password);
		model.addAttribute("acc", account);
		model.addAttribute("pwd", password);
		Manage manage_check = mservice.isExist(new Manage(account, password));
		if (manage_check != null) {
			model.addAttribute("MLoginOK", manage_check);
			return "Product_insert";
		}
		return "Errormsg";
	}

	@RequestMapping(value = "/Mlogout.controller")
	public String ActionLogout() {
		return "MLogout";
	}

//	@PostMapping(value = "/productinsert.controller")
//	public String ActionInsert() {
//		return "Product_insert";
//	}
	@RequestMapping(value = "/productinsert.controller")
	public String Insert() {
		return "Product_insert";
	}

	@RequestMapping(value = "/processproductinsert.controller")
	protected String doInsert(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("p_img") MultipartFile[] p_img, Model model)
			throws ServletException, IOException, SQLException {
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String p_type = request.getParameter("p_type");
		String p_name = request.getParameter("p_name");
		String monitor = request.getParameter("monitor");
		String cpu = request.getParameter("cpu");
		String ram = request.getParameter("ram");
		String storage = request.getParameter("storage");
		String des = request.getParameter("des");
		String color = request.getParameter("color");
		int price = Integer.parseInt(request.getParameter("price"));
		// DecimalFormat df = new DecimalFormat("0.00");
		double discount = Double.valueOf(request.getParameter("discount"));
		String delete_flag = request.getParameter("delete_flag");

		MultipartFile img = p_img[0];

		String p_img1 = saveFile(img, request);

		Product newProduct = new Product(p_id, p_type, p_name, p_img1, monitor, cpu, ram, storage, des, color, price,
				discount, delete_flag);

		System.out.println(newProduct.toString());

		boolean result = pservice.insert(newProduct);
		Map<String, String> insert = new HashMap<String, String>();
		model.addAttribute("insertkey", insert);
		if (result) {
			insert.put("insertsuccess", "新增成功!");
		} else {
			System.out.println("mb is null");
		}

		List<Product> listProduct = pservice.list();
		request.setAttribute("listproduct", listProduct);

		return "Product_insert";

	}

	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) throws IOException {

		String filename = null;
		String storefilename = null;

		try {

			// String uploadDir = "/uploads/";
			String realPath = context.getRealPath("/WEB-INF/uploads");
			filename = realPath + File.separator + uploadFile.getOriginalFilename();
			storefilename = uploadFile.getOriginalFilename();

			File transferFile = new File(filename);
			uploadFile.transferTo(transferFile);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return storefilename;
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
		response.setContentLength((int) file.length());
		IOUtils.copy(input, output);

	}

	@RequestMapping(value = "/productquery.controller")
	public String Processquery(@SessionAttribute("MLoginOK") Manage manage, Model model) {
		if (manage != null) {
			return "MProduct_query";
		}
		return "Errormsg";
	}

	@RequestMapping(value = "/querybytype.controller")
	public String QueryType(@RequestParam("p_type") String p_type, Model model) {
		List<Product> list = pservice.query_type(p_type);
		if (list != null) {
			model.addAttribute("type_items", list);
			model.addAttribute("p_type", p_type);
		}
		return "QueryType_outcome";
	}

	@RequestMapping(value = "/querybyname.controller")
	public String QueryName(@RequestParam("p_name") String p_name, Model model) {
		List<Product> list = pservice.query_name(p_name);
		if (list != null) {
			model.addAttribute("name_items", list);
			model.addAttribute("p_name", p_name);
		}
		return "QueryName_outcome";
	}

	@RequestMapping(value = "/queryproductsingle.controller")
	public String QuerySingle(@RequestParam("p_id") int p_id, Model model) {
		List<Product> list = pservice.query_single(p_id);
		model.addAttribute("single_items", list);
		return "QuerySingleItem_outcome";
	}

	@RequestMapping(value = "querydata.controller")
	public String QueryData(@RequestParam(value = "p_type", required = false) String p_type,
			@RequestParam(value = "p_name", required = false) String p_name, Model model) {
		Map<String, String> bothnull = new HashMap<String, String>();
		model.addAttribute("bothkey", bothnull);

		if (p_type.length() == 0 && p_name.length() == 0) {
			bothnull.put("null", "不可都為空");
		}
		if (bothnull.isEmpty()) {
			List<Product> list = pservice.query_data(p_type,p_name);
			model.addAttribute("querydata", list);
			System.out.println("11111");
			return "Querydata_outcome";
		}
		return "MProduct-query";
	}
	

	@PostMapping(value = "/productupdate.controller")
	public String Update(HttpServletRequest request, HttpServletResponse Response, @RequestParam("p_id") int p_id,
			@RequestParam("p_type") String p_type, @RequestParam("p_name") String p_name,
			@RequestParam(value = "files", required = false) MultipartFile[] files,
			@RequestParam("monitor") String monitor, @RequestParam("cpu") String cpu, @RequestParam("ram") String ram,
			@RequestParam("storage") String storage, @RequestParam("des") String des,
			@RequestParam("color") String color, @RequestParam("price") int price,
			@RequestParam("discount") double discount, @RequestParam("df") String delete_flag, Model model)
			throws IOException {

		MultipartFile img = files[0];
		String p_img = saveFile(img, request);
		Product product_update = pservice.update(new Product(p_id, p_type, p_name, p_img, monitor, cpu, ram, storage,
				des, color, price, discount, delete_flag));
		model.addAttribute("p_id", product_update.getP_id());
		pservice.update(product_update);
		List<Product> listProduct = pservice.list();
		request.setAttribute("listproduct", listProduct);

		return "redirect:/queryproductsingle.controller";
	}

	@RequestMapping(value = "/productdelete_type.controller")
	public String Delete_Type(@RequestParam("p_id") int p_id, Model model) {
		pservice.delete(p_id);
		return "redirect:/querybytype.controller";
	}

	@RequestMapping(value = "/productdelete_name.controller")
	public String Delete_Name(@RequestParam("p_id") int p_id, Model model) {
		pservice.delete(p_id);
		return "redirect:/querybyname.controller";
	}
	
	

	
	
	
}
//	@PostMapping(value = "/processdelete.controller")
//	public String ProcessDelete(@RequestParam("foodid") Integer foodid, Model model) {
//		System.out.println("foodiddddd>>>>>" + foodid);
//		cservice.delete(foodid);
//		// List<Cabinet> list = cservice.queryall(memberid);
//		// model.addAttribute("items", list);
//		return "redirect:/processquery.controller";
//
//	}

//	@RequestMapping(value = "/processquerysingle.controller")
//	public String Processquerysingle(@RequestParam("foodid") Integer foodid, Model model) {
//		System.out.println("foodiddddd>>>>>" + foodid);
//		List<Cabinet> list = cservice.query(foodid);
//		model.addAttribute("item", list);
//		return "Cabinet_update";
//
//	}

//	@PostMapping(value = "/processupdate.controller")
//	public String Processupdate(@RequestParam("foodid") Integer foodid, @RequestParam("foodname") String foodname,
//			@RequestParam("count") Integer count,Model model) {
//		System.out.println(foodid);
//		System.out.println(foodname);
//		System.out.println(count);
//		Cabinet cb = cservice.update(foodid,foodname,count);
//		model.addAttribute("foodid", cb.getFoodid());
//		return "redirect:/processquerysingle.controller";
//
//	}
