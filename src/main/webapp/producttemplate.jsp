<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
</head>
<body>
<h1>Products</h1>
<ul>
    <c:forEach var="product" items="${products}">
        <li>${product.name} - ${product.price}</li>
    </c:forEach>
</ul>
</body>
</html>
