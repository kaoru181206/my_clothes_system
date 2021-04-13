<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Clothes</title>
<link rel="stylesheet" href="<c:url value='/css/topPage.css' />">

</head>
<body>
<div class = "top-main">
    <div class = "top-message">
        <h2>My Clothes</h2>
    </div>
    <div class = "top-btn">
        <p><a href="<c:url value='/users/new' />"class="btn signup">新規会員登録</a></p>
        <p><a href="<c:url value='/top/login' />"class="btn login">ログイン</a></p>
    </div>
</div>
</body>
</html>


