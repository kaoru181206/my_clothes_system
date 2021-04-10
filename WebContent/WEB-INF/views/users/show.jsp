<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">

                <h2>マイページ</h2>
                <br /><br />
                <p>【アカウント情報】</p>

                <table id="account">
                    <tbody>
                        <tr>
                            <th>ユーザーID</th>
                            <td><c:out value="${user.code}" /></td>
                        </tr>
                        <tr>
                            <th>ユーザー名</th>
                            <td><c:out value="${user.name}" /></td>
                        </tr>

                    </tbody>
                </table>

                <p><a href="<c:url value='/users/edit?id=${user.id}' />">アカウント情報を編集する</a></p>

                <p><a href="<c:url value='/posts/my' />">My投稿 一覧</a></p>


            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
