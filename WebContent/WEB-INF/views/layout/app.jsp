<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>My Clothes</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id = "wrapper">
            <div id = "header">
                <div id = "header_menu">
                    <h1><a href="<c:url value='/posts/index' />">My Clothes</a></h1>&nbsp;&nbsp;&nbsp;
                    <a href="<c:url value='/posts/new' />">投稿する</a>&nbsp;
                    <a href="<c:url value='/users/mypage' />">マイページ</a>&nbsp;
                </div>
                <c:if test="${sessionScope.login_user != null}">
                    <div id="user_name">
                        <c:out value="${sessionScope.login_user.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">ログアウト</a>
                    </div>
                </c:if>
            </div>
            <div id = "content">
                ${param.content}
            </div>
            <div id = "footer">
                by Kaoru Shiraga.
            </div>
        </div>

    </body>
</html>
