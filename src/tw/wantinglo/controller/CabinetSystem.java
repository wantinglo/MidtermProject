package tw.wantinglo.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.wantinglo.model.member.Cabinet;
import tw.wantinglo.model.member.MemberBean;
import tw.wantinglo.model.member.cabService;


@Controller
@SessionAttributes(names = { "foodid", "items", "item" })
public class CabinetSystem {
	private cabService cservice;

	@Autowired
	public CabinetSystem(cabService cservice) {
		this.cservice = cservice;
	}

	@GetMapping(value = "/insert.controller")
	public String ActionInsert() {
		return "Cabinet_insert";
	}

	@PostMapping(value = "/processinsert.controller")
	public String ProcessInsert(@SessionAttribute("MBB") MemberBean mb, @RequestParam("foodname") String foodname,
			@RequestParam("foodclass") String foodclass, @RequestParam("expirydate") Date expirydate,
			@RequestParam("count") Integer count, Model model) {
		Map<String, String> nullMsgMap = new HashMap<String, String>();
		model.addAttribute("nullMsgKey", nullMsgMap);
		if (foodname == null || foodname.length() == 0) {
			nullMsgMap.put("nameEmptyError", "食物名稱不可空白");
		}
		if (foodclass == null || foodclass.length() == 0) {
			nullMsgMap.put("classEmptyError", "食物類別不可空白");
		}
		if (expirydate == null) {
			nullMsgMap.put("dateEmptyError", "有效期限不可空白");
		}
		if (count == null) {
			nullMsgMap.put("countEmptyError", "數量不可空白");
		}

		if (!nullMsgMap.isEmpty()) {
			return "Cabinet_insert";
		}
		try {
			Map<String, String> insert = new HashMap<String, String>();
			model.addAttribute("insertkey", insert);
			Set<Cabinet> scb = new HashSet<Cabinet>();
			Cabinet cb = new Cabinet(foodname, foodclass, expirydate, count);
			cb.setProfiles(mb);
			scb.add(cb);
			if (mb != null) {
				mb.setCabinet(scb);
				System.out.println(mb.getMemberid());
				boolean result = cservice.insert(cb);
				if (result) {
					model.addAttribute("foodid", cb.getFoodid());
					System.out.println(cb.getFoodid());
					insert.put("insertsuccess", "新增成功!");
				}
			} else {
				System.out.println("mb is null");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Cabinet_insert";
	}

	@GetMapping(value = "/query.controller")
	public String Actionquery() {
		return "Cabinet_query";
	}

	@RequestMapping(value = "/processquery.controller")
	public String Processquery(@SessionAttribute("LoginOK") Integer memberid, Model model) {
		List<Cabinet> list = cservice.queryall(memberid);
		if (list != null) {
			model.addAttribute("items", list);
			return "Cabinet_qoutcome";
		}
		Map<String, String> queryerr = new HashMap<String, String>();
		model.addAttribute("querykey", queryerr);
		queryerr.put("querynull", "未有任何庫存");
		return "Cabinet_query";
	}

	@PostMapping(value = "/processdelete.controller")
	public String ProcessDelete(@RequestParam("foodid") Integer foodid, Model model) {
		System.out.println("foodiddddd>>>>>" + foodid);
		cservice.delete(foodid);
		// List<Cabinet> list = cservice.queryall(memberid);
		// model.addAttribute("items", list);
		return "redirect:/processquery.controller";

	}

	@RequestMapping(value = "/processquerysingle.controller")
	public String Processquerysingle(@RequestParam("foodid") Integer foodid, Model model) {
		System.out.println("foodiddddd>>>>>" + foodid);
		List<Cabinet> list = cservice.query(foodid);
		model.addAttribute("item", list);
		return "Cabinet_update";

	}

	@PostMapping(value = "/processupdate.controller")
	public String Processupdate(@RequestParam("foodid") Integer foodid, @RequestParam("foodname") String foodname,
			@RequestParam("count") Integer count,Model model) {
		System.out.println(foodid);
		System.out.println(foodname);
		System.out.println(count);
		Cabinet cb = cservice.update(foodid,foodname,count);
		model.addAttribute("foodid", cb.getFoodid());
		return "redirect:/processquerysingle.controller";

	}

}
