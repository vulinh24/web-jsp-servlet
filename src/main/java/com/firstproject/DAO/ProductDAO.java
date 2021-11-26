package com.firstproject.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.firstproject.model.ProductModel;

public class ProductDAO {
	public static int addProduct(ProductModel product) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "insert products values (?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProd_name());
			ps.setFloat(2, product.getProd_price());
			ps.setString(3, product.getProd_imgurl());
			ps.setString(4, product.getProd_description());
			ps.setInt(5, product.getCate_id());
			ps.executeUpdate();
			return 1;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static ArrayList<ProductModel> getAllProducts() {
		ArrayList<ProductModel> products = new ArrayList<ProductModel>();
		Connection conn = null;
		Statement st = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "Select * from products";
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Integer id = rs.getInt("prod_id");
				String name = rs.getString("prod_name");
				String imgurl = rs.getString("prod_imgurl");
				String description = rs.getString("prod_description");
				Float price = rs.getFloat("prod_price");
				Integer cate_id = rs.getInt("cate_id");
				products.add(new ProductModel(id,name,price,imgurl,description,cate_id));
			}
			return products;
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
	
	public static ArrayList<ProductModel> getAllProductsAtDistance(int from, int to) {
		ArrayList<ProductModel> products = new ArrayList<ProductModel>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnectDB.getConnection();
//			String sql = 
//					"Select * from products order by prod_id "+ type + " offset " + String.valueOf(from) +
//					" rows fetch next " + String.valueOf(to) + " rows only";
			String sql = "Select * from products order by prod_id desc offset ? rows fetch next ? rows only";
			ps = conn.prepareStatement(sql);
//			ps.setString(1,"desc");
			ps.setInt(1, from);
			ps.setInt(2, to);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer id = rs.getInt("prod_id");
				String name = rs.getString("prod_name");
				String imgurl = rs.getString("prod_imgurl");
				String description = rs.getString("prod_description");
				Float price = rs.getFloat("prod_price");
				Integer cate_id = rs.getInt("cate_id");
				products.add(new ProductModel(id,name,price,imgurl,description,cate_id));
			}
			return products;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static ArrayList<ProductModel> getAllProductsByCatelogy(int from, int to, int Cate_id) {
		ArrayList<ProductModel> products = new ArrayList<ProductModel>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "Select * from products where cate_id = ? order by prod_id offset ? rows fetch next ? rows only";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,Cate_id);
			ps.setInt(2, from);
			ps.setInt(3, to);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer id = rs.getInt("prod_id");
				String name = rs.getString("prod_name");
				String imgurl = rs.getString("prod_imgurl");
				String description = rs.getString("prod_description");
				Float price = rs.getFloat("prod_price");
				Integer cate_id = rs.getInt("cate_id");
				products.add(new ProductModel(id,name,price,imgurl,description,cate_id));
			}
			return products;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static ProductModel getProductById(Integer prod_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ProductModel product = new ProductModel();
		try {
			conn = ConnectDB.getConnection();
			String sql = "select * from products where prod_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				product.setProd_id(rs.getInt("prod_id"));
				product.setProd_name(rs.getString("prod_name"));
				product.setProd_price(rs.getFloat("prod_price"));
				product.setProd_imgurl(rs.getString("prod_imgurl"));
				product.setProd_description(rs.getString("prod_description"));
				product.setCate_id(rs.getInt("cate_id"));
			}
			return product;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static ProductModel updateProductById(ProductModel prod) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = 
				"update products set prod_name = ?, prod_price = ? , prod_imgurl = ? , prod_description = ?,cate_id = ? where prod_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(6, prod.getProd_id());
			ps.setString(1,prod.getProd_name());
			ps.setFloat(2, prod.getProd_price());
			ps.setString(3,prod.getProd_imgurl());
			ps.setString(4,prod.getProd_description());
			ps.setInt(5, prod.getCate_id());
			ps.executeUpdate();
			return prod;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static int deleteProductById(Integer id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnectDB.getConnection();
			String sql = "delete products where prod_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			return 1;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
