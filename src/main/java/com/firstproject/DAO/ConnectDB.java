package com.firstproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDB {
	public static Connection createConnection(String dbname,String username,String password) throws ClassNotFoundException, SQLException {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://DESKTOP-KLT9QT6\\SQLEXPRESS:1433;instance=SQLEXPRESS;databaseName=" + dbname;
		return DriverManager.getConnection(url,username,password);
	}
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		return createConnection("firstprojectjavaweb","admin","1234");
	}
	public static void main(String args[]) {
		try {
			Connection conn = getConnection();
			String sql = "Select * from products order by prod_id desc offset 0 rows fetch next 10 rows only";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				System.out.println(rs.getString("prod_id"));
				System.out.println(rs.getString("prod_name"));
				System.out.println(rs.getString("prod_price"));
			}
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ok");
	}

}
