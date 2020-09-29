package dao;
import java.util.*;
import vo.*;
import java.sql.*;
import commons.DBUtil;

public class OrdersDao {
	// 주문상태 수정
	public void updateOrdersState(Orders orders) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn+"<--conn");
		
		String sql = "update orders set orders_state = ? where orders_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrdersState());
		stmt.setInt(2, orders.getOrdersId());
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
	// 주문상태 별 선택
	public ArrayList<String> selectOrdersStateList() throws Exception {
		ArrayList<String> list = new  ArrayList<String>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select distinct o.orders_state from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			list.add(rs.getString("o.orders_state"));
		}
		return list;
	}
	// 주문 리스트
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception {
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		 * select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_mail, o.orders_addr, o.orders_state, o.orders_date, p.product_name
		 * from orders o inner join product p order과 product 조인 order를 o로 명명 / product를 p로 명명
		 * on o.product_id and p.product_id; o.product_id와 p.product_id가 같을 때
		 */
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id ";	
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
			oap.getOrders().setProductId(rs.getInt("o.product_id"));
			oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
			oap.getOrders().setMemberEmail(rs.getString("o.member_email"));
			oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
			oap.getProduct().setProductName(rs.getString("p.product_name"));
			list.add(oap);
		}
		return list;
	}
	// 주문상태별 리스트
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id where o.orders_state = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
			oap.getOrders().setProductId(rs.getInt("o.product_id"));
			oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
			oap.getOrders().setMemberEmail(rs.getString("o.member_email"));
			oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
			oap.getProduct().setProductName(rs.getString("p.product_name"));
			list.add(oap);
		}
		return list;
	}
}
