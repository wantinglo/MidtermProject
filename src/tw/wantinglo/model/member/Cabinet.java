package tw.wantinglo.model.member;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "cabinet") 
public class Cabinet {
	private int foodid;	
	private String foodname;
	private String foodclass;
	private Date expirydate;
	private int count;
	private MemberBean profiles;
	
	public Cabinet() {
	}
	public Cabinet(String foodname, String foodclass, Date expirydate, Integer count) {
		this.foodname=foodname;
		this.foodclass=foodclass;
		this.expirydate=expirydate;
		this.count=count;
	}

	public Cabinet(Integer foodid, String foodname, Integer count) {
		this.foodid=foodid;
		this.foodname=foodname;
		this.count=count;
	}
	@Column(name = "FOODID") 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getFoodid() {
		return foodid;
	}

	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}

	@Column(name = "FOODNAME")
	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	
	@Column(name = "FOODCLASS")
	public String getFoodclass() {
		return foodclass;
	}

	public void setFoodclass(String foodclass) {
		this.foodclass = foodclass;
	}
	
	@Column(name = "EXPIRYDATE")
	public Date getExpirydate() {
		return expirydate;
	}

	public void setExpirydate(Date date) {
		this.expirydate = date;
	}
	
	@Column(name = "COUNT")
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	

	@ManyToOne(targetEntity = MemberBean.class)
	@JoinColumn(name ="MEMBERID",referencedColumnName = "MEMBERID",nullable=false)
	public MemberBean getProfiles() {
		return profiles;
	}

	public void setProfiles(MemberBean profiles) {
		this.profiles = profiles;
	}

	
	
	
}
