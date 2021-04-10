<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/css/users.css' />">
<div class="main users-new">
<div class="container">
        <h2 class="form-heading">新規会員登録</h2>

       <form method="POST" action="<c:url value='/users/create' />">
            <c:import url="_form.jsp" />
        </form>



        <p><a href="<c:url value='/top/page' />"class="btn top">TOPに戻る</a></p>

</div>
</div>
