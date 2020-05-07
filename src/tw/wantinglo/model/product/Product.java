package tw.wantinglo.model.product;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="PRODUCT")
public class Product {
	
	private int p_id;
	private String p_type;
	private String  p_img;
	private String p_name;
	private String monitor;
	private String cpu;
	private String ram;
	private String storage;
	private String des;
	private String color;
	private int price;
	private double discount;
	private String delete_flag;
	
	public Product() {		
	}
	
	
	public Product(int p_id,String p_type, String p_name, String p_img, String monitor, String cpu, String ram,
			String storage, String des, String color, int price, double discount, String delete_flag) {
		this.p_id=p_id;
		this.p_type=p_type;
		this.p_name= p_name;
		this.p_img=p_img;
		this.monitor=monitor;
		this.cpu=cpu;
		this.ram=ram;
		this.storage=storage;
		this.des=des;
		this.color=color;
		this.price=price;
		this.discount=discount;
		this.delete_flag=delete_flag;
	}
	public Product(String p_type, String p_name, String p_img, String monitor, String cpu, String ram,
			String storage, String des, String color, int price, double discount, String delete_flag) {
		this.p_type=p_type;
		this.p_name= p_name;
		this.p_img=p_img;
		this.monitor=monitor;
		this.cpu=cpu;
		this.ram=ram;
		this.storage=storage;
		this.des=des;
		this.color=color;
		this.price=price;
		this.discount=discount;
		this.delete_flag=delete_flag;
	}
	@Id
	@Column(name="P_ID")
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	
	@Column(name="P_TYPE")
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	
	@Column(name="P_IMG",nullable=true)
	public String  getP_img() {
		return p_img;
	}
	public void setP_img( String  p_img) {
		this.p_img = p_img;
	}
	
	
	@Column(name="P_NAME")
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	@Column(name="MONITOR")
	public String getMonitor() {
		return monitor;
	}
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	
	@Column(name="CPU")
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	@Column(name="RAM")
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	
	@Column(name="STORAGE")
	public String getStorage() {
		return storage;
	}
	public void setStorage(String storage) {
		this.storage = storage;
	}
	
	@Column(name="DES")
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	@Column(name="COLOR")
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	@Column(name="PRICE")
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Column(name="DISCOUNT")
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	
	@Column(name="DELETE_FLAG")
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}
	
	

}


