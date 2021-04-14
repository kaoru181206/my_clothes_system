<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/css/users.css' />">
<div class="container">
    <h2 class="form-heading">ログイン</h2>
    <c:if test="${hasError}">
        <div id="flush_error">ユーザーIDかパスワードが間違っています。</div>
    </c:if>
    <c:if test="${flush != null}">
        <div id="flush_success">
            <c:out value="${flush}"></c:out>
        </div>
    </c:if>

    <div class="form users-form">
        <div class="form-body">
            <div class="main users-new">


                <form method="POST" action="<c:url value='/login' />">
                    <label for="code">ユーザーID</label><br />
                    <input type="text" name="code" value="${code}" /><br /><br />
                    <label for="password">パスワード</label><br />
                    <input type="password" name="password" /><br /><br />
                    <input type="hidden" name="_token" value="${_token}" />
                    <button type="submit">ログイン</button>
                    <br />


                </form>
            </div>
        </div>
    </div>
    <p><a href="<c:url value='/top/page' />"class="btn top">TOPに戻る</a></p>
</div>
