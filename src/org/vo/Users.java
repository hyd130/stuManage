package org.vo;



import java.sql.Date;


public class Users {

	
	private int u_id;
	private int u_num;
	private String u_paswd;
	private String u_type;
	private String u_tel;
	private Date create_time;
	
	
	public Users(int u_id, int u_num, String u_paswd, String u_type, String u_tel, Date create_time) {
		super();
		this.u_id = u_id;
		this.u_num = u_num;
		this.u_paswd = u_paswd;
		this.u_type = u_type;
		this.u_tel = u_tel;
		this.create_time = create_time;
	}
	public Users() {
		super();
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getU_paswd() {
		return u_paswd;
	}
	public void setU_paswd(String u_paswd) {
		this.u_paswd = u_paswd;
	}
	public String getU_type() {
		return u_type;
	}
	public void setU_type(String u_type) {
		this.u_type = u_type;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	

	
}
