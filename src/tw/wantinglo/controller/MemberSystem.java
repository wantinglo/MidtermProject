package tw.wantinglo.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.wantinglo.model.member.MemberBean;
import tw.wantinglo.model.member.memDAO;

@Controller
@SessionAttributes(names = {"LoginOK", "MBB"})
public class MemberSystem {

	private memDAO mdao;
	//private Session session;

	@Autowired
	public MemberSystem(memDAO mdao) {
		this.mdao = mdao;
	}
	
	@GetMapping(value = "/index.controller")
	public String ActionIndex() {
		return "index";
	}

	@GetMapping(value = "/login.controller")
	public String ActionLogin() {
		return "Login";
	}

	@PostMapping(value = "/processlogin.controller")
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
		//model.addAttribute("acc", account);
		//model.addAttribute("pwd", password);
		MemberBean mb = mdao.isExist(new MemberBean(account, password));
		if (mb != null) {
			model.addAttribute("LoginOK", mb.getMemberid());
			model.addAttribute("MBB", mb);
			System.out.println("memberiddddd"+mb.getMemberid());
			return "Cabinet_insert";
		}
		return "Errormsg";
	}

	@GetMapping(value = "/register.controller")
	public String ActionRegister() {
		return "Register";
	}

	@PostMapping(value = "/processregister.controller")
	public String ProcessRegister(@RequestParam("accapply") String account, @RequestParam("pwdapply") String password,
			@RequestParam("nameapply") String name, @RequestParam("phoneapply") String phone, Model model)
			throws SQLException {
		Map<String, String> insert = new HashMap<String, String>();
		model.addAttribute("insertkey", insert);
		boolean result = mdao.insert(new MemberBean(account, password, name, phone));
		if (result) {
			insert.put("registersuccess", "註冊成功，請重新登入!");
			return "Login";
		}
		return "Register";
	}
}
