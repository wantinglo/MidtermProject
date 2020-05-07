package tw.wantinglo.model.member;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "profiles")
public class MemberBean {
	private int memberid;
	private String account;
	private String password;
	private String name;
	private String phone;
	private Set<Cabinet> cabinet = new HashSet<>();

	public MemberBean() {
	}

	public MemberBean(String account, String password) {
		this.account = account;
		this.password = password;
	}

	public MemberBean(String account, String password, String name, String phone) {
		this.account = account;
		this.password = password;
		this.name = name;
		this.phone = phone;
	}

	@Id
	@Column(name = "MEMBERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	@Column(name = "ACCOUNT")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "PHONE")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(targetEntity = Cabinet.class, mappedBy = "profiles", cascade = CascadeType.ALL)
	public Set<Cabinet> getCabinet() {
		return cabinet;
	}

	public void setCabinet(Set<Cabinet> cbean) {
		this.cabinet = cbean;
	}

}
