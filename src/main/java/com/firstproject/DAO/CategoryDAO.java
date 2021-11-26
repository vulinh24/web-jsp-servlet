package com.firstproject.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.firstproject.model.CategoryModel;

public class CategoryDAO {
	public static ArrayList<CategoryModel> getAll() {
		ArrayList<CategoryModel> categorys = new ArrayList<CategoryModel>();
		Connection conn = null;
		Statement st = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "Select * from categorys";
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Integer id = rs.getInt("cate_id");
				String name = rs.getString("cate_name");
				categorys.add(new CategoryModel(id,name));
			}
			return categorys;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (st != null)
					st.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
