<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	// 1. 상품아이디와 이미지파일을 받는다.
	// 2. 이미지파일을 서버/images폴더에 새로운 이름으로 저장
	// 3. 저장된 이미지의 이름을 상품테이블에서 수정한다. ex) default.jpg -> 새로 생성된 이름으로 변경
	// enctype이 multipart일 경우 request.getParameter로 값 받지 못함
	/*String productId = request.getParameter("productId");
		String productPic = request.getParameter("productPic");
		System.out.println(productId + "<--productId");
		System.out.println(productPic + "<-- prodcutPic");
	*/
	
	// cos.jar 외부라이브러리 사용(내부 라이브러리 사용도 가능하지만 사용방법이 복잡)
	DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy(); // 파일 이름을 만들어주는 객체
	
	int size = 1024*1024*100; // 100MB
	String path = application.getRealPath("image"); //image의 실제 경로
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", dfp);
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	String productPic = multi.getFilesystemName("productPic");
	
	System.out.println(productId + "<-- productId");	
	System.out.println(multi.getOriginalFileName("productPic") + "<--파일원본이름");
	System.out.println(multi.getFilesystemName("productPic")+"<-- 새로 생성된 파일 이름");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	//update product set product_pic = ? where product_id = ?;
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+productId);
%>