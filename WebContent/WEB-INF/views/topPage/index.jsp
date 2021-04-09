<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <h2>My Clothes</h2>
        <p><a href="<c:url value='/users/new' />">新規会員登録</a></p>
        <p><a href="<c:url value='/top/login' />">ログイン</a></p>
    </c:param>
</c:import>