<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h2>新規購入品投稿</h2>
        <br /><br />


        <form method="POST" action="<c:url value='/posts/create' />">
            <c:import url="_form.jsp" />
        </form>

        <p><a href="<c:url value='/posts/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>