package dao;
import java.util.*;
import commons.DBUtil;
import java.sql.*;
import vo.*;

// �����ϴ� �۾��� �ٸ� ��� �޼��带 �и��ؼ� �ϴ°� ����
public class ProductDao {
	//ǰ�� / �Ǹ��� Ŭ���ϸ� �ٲ�� �޼���
	public void updateProductSoldout(int productId, String productSoldout) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "update product set product_soldout = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//��۹�ư? Ŭ���ϸ� �ٲ�� ��
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");
		}else {
			stmt.setString(1, "Y");
		}
		
		stmt.setInt(2, productId);
		int row = stmt.executeUpdate();
		System.out.println(row + "�� ����");
		
		conn.close();
	}
	
	// ��ǰ �������� �޼���
	public Product selectProductOne (int productId) throws Exception{
		Product product = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		// mariadb�� ����
		
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic")); // default.jpg
		}
		
		conn.close();
		return product;
	}
	
	// ��ǰ �������� ����
	public void updateProductOne(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "update product set product_name = ?, product_price = ?, product_content = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductName());
		stmt.setInt(2, product.getProductPrice());
		stmt.setString(3, product.getProductContent());
		stmt.setInt(4, product.getProductId());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	// ��ǰ ����
	public void deleteProductOne(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "delete from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getProductId());
		stmt.executeUpdate();
		
		conn.close();
	}
		
	//��ǰ �߰� �޼���
	public void insertProduct(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) values(?, ?, ?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
	//ī�װ� ������ ���� ��ǰ ��� ǥ�� �޼���
	public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>(); // ������ ���Ŀ� ArrayList<Product>�� �Է��ؼ�?
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout from product where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		
		conn.close();
		return list;
	}
	
	// ��ü ��ǰ ��� �޼���
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout from product limit 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		
		conn.close();
		return list;
	}
	
	public void updateProductPic(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "update product set product_pic = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductPic());
		stmt.setInt(2, product.getProductId());
		stmt.executeUpdate();
		
		conn.close();
	}
}
