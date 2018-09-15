<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>

<script>
	function product_delete() {
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/shop/product/delete.do";
			document.form1.submit();
		}
	}
	
	function product_update() {
		var product_name = $("#product_name").val();
		var product_price = $("#product_price").val();
		var product_desc = $("#product_desc").val();
		
		if (product_name == ""){
			alert("상품이름을 입력하세요.");
			$("#product_name").focus();
			return;
		}
		
		if(product_price == ""){
			alert("가격을 입력하세요.");
			$("#product_price").focus();
			return;
		}
		
		if(product_desc == "") {
			alert("상품 설명을 입력하세요.");
			$("#product_desc").focus();
			return;
		}
		document.form1.action = "${path}/shop/product/update.do";
		document.form1.submit();
	}
</script>

<h2>상품 정보 편집</h2>
<form name="form1" method="post"
enctype="multipart/form-data">
	<table>
		<tr>
			<td>상품명</td>
			<td><input name="product_name" id="product_name"
			value="${dto.product_name}"></td>
		</tr>
		
		<tr>
			<td>가격</td>
			<td><input name="product_price" id="product_price"
			value="${dto.product_price}"></td>
		</tr>
		
		<tr>
			<td>상품설명</td>
			<td><textarea rows="5" cols="60" name="product_desc"
			id="product_desc">${dto.product_desc}</textarea></td>
		</tr>
		
		<tr>
			<td>상품이미지</td>
			<td><img src="${path}/images/${dto.picture_url}" width="300px"
			height="300px"><br>
			<input type="file" name="file1" id="file1"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input name="hidden" name="product_id" value="${dto.product_id}">
				<input type="button" value="수정" onclick="product_update()">
				<input type="button" value="삭제" onclick="product_delete()">
				<input type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'">
			</td>
		</tr>
	</table>


</form>

</body>
</html>