package com.firstproject.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.firstproject.model.UserModel;

public class UserDAO {
	
	public static UserModel getUser(String user , String pass) {
		Connection conn = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "select * from users where user_username = ? and user_password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,user);
			ps.setString(2,pass);
			ResultSet rs = ps.executeQuery();
			UserModel userModel = new UserModel();
			if (rs.next() == false) return null;
			else {
				userModel.setUser_username(rs.getString("user_username"));
				userModel.setUser_password(rs.getString("user_password"));
				userModel.setUser_authorization(rs.getString("user_authorization"));
			}
			return userModel;
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
