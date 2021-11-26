package com.firstproject.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.firstproject.model.CartModel;
import com.firstproject.model.CartProductModel;

public class CartDAO {
	public static int addOneProduct(CartModel cart) {
		Connection conn = null;
		PreparedStatement ps = null;
		Statement st = null;
		try {
			conn = ConnectDB.getConnection();
			String firstsql = "select * from carts where user_username = '" + cart.getUser_username()
					+ "' and prod_id = " + cart.getProd_id();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(firstsql);
			if (!rs.next()) {
				String sql = "insert carts values (?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, cart.getUser_username());
				ps.setInt(2, cart.getProd_id());
				ps.setInt(3, 1);
				ps.executeUpdate();
			} else {
				String sql = "update carts set amount = amount+ " + cart.getAmount() + " where user_username = '"
						+ cart.getUser_username() + "' and prod_id = " + cart.getProd_id();
				st.executeUpdate(sql);
			}
			return 1;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static CartDisplayModel getProductByUsername(String username) {
		Connection conn = null;
		PreparedStatement ps = null;
		Statement st = null;
		ArrayList<CartProductModel> products = new ArrayList<>();
		try {
			conn = ConnectDB.getConnection();
			String sql = "select carts.user_username,products.prod_id,products.prod_name,prod_imgurl,prod_price,amount"
					+ " from carts inner join products on carts.prod_id = products.prod_id where carts.user_username = ?" ;
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CartProductModel prod = new CartProductModel();
				prod.setProd_id(rs.getInt("prod_id"));
				prod.setProd_name(rs.getString("prod_name"));
				prod.setProd_imgurl(rs.getString("prod_imgurl"));
				prod.setProd_price(rs.getFloat("prod_price"));
				prod.setQuantity(rs.getInt("amount"));
				products.add(prod);
			}
			return new CartDisplayModel(username,products);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static int deleteOneProduct(String username, int prodid) {
		Connection conn = null;
		PreparedStatement ps = null;
		Statement st = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "delete carts where user_username = ? and prod_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			ps.setInt(2, prodid);
			ps.executeUpdate();
			return 1;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
