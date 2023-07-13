package org.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Util {

	private static DataSource ds;
	static{
		ds=new ComboPooledDataSource();
	}
	public static DataSource getDs(){
		return ds;
	}
	
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}

	public static void main(String args[]) throws SQLException {
		new C3p0Util();
		System.out.println(C3p0Util.getConnection()+"连接成功");
	}
	
}
