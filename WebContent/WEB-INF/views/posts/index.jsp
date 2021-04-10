<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h2>投稿 一覧</h2>
        <br /><br />

        <table id="post_list">
            <tbody>
                <tr>
                    <th class="post_name">ユーザー名</th>
                    <th class="post_brandName">ブランド名</th>
                    <th class="post_category">カテゴリー</th>
                    <th class="post_date">購入日</th>
                    <th class="post_like">いいね数</th>
                    <th class="post_action">詳細</th>
                </tr>
                <c:forEach var="post" items="${posts}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="post_name"><c:out value="${post.user.name}" /></td>
                        <td class="post_brandName"><c:out value="${post.brandName}" /></td>
                        <td class="post_category">
                            <c:choose>
                                <c:when test="${post.category == 0}">アウター</c:when>
                                <c:when test="${post.category == 1}">トップス</c:when>
                                <c:when test="${post.category == 2}">パンツ</c:when>
                                <c:when test="${post.category == 3}">スニーカー</c:when>
                                <c:when test="${post.category == 4}">小物類</c:when>
                            </c:choose>
                        </td>
                        <td class="post_date"><fmt:formatDate value='${post.purchase_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="post_like">︎${post.likes}</td>
                        <td class="post_action"><a href="<c:url value='/posts/show?id=${post.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

        <div id="pagination">
            （全 ${posts_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((posts_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/posts/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="<c:url value='/posts/new' />">新規購入品投稿</a></p>
    </c:param>
</c:import>
