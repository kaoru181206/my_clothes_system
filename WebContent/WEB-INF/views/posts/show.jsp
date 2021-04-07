<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${post != null}">
                <h2>購入品 詳細</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>ユーザー名</th>
                            <td><c:out value="${post.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>購入日</th>
                            <td><fmt:formatDate value="${post.purchase_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>ブランド名</th>
                            <td><c:out value="${post.brandName}" /></td>
                        </tr>
                        <tr>
                            <th>値段</th>
                            <td><c:out value="${post.price}" /></td>
                        </tr>
                        <tr>
                            <th>カテゴリー</th>
                            <td>
                                <c:choose>
                                    <c:when test="${post.category == 0}">アウター</c:when>
                                    <c:when test="${post.category == 1}">トップス</c:when>
                                    <c:when test="${post.category == 2}">パンツ</c:when>
                                    <c:when test="${post.category == 3}">スニーカー</c:when>
                                    <c:when test="${post.category == 4}">小物類</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>コーディネート</th>
                            <td><c:out value="${post.content}" /></td>
                        </tr>
                        <tr>
                            <th>いいね数</th>
                            <td><c:out value="${post.likes }" /></td>
                        </tr>
                        <tr>
                            <th>投稿日時</th>
                            <td>
                                <fmt:formatDate value="${post.created_at}" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${post.updated_at}" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br />

                <!-- いいねボタンを追加 -->
                <c:if test="${sessionScope.login_user.id != post.user.id}">
                    <form method="POST" action="<c:url value='/likes/create'/>">
                        <button type="submit" name="likes">いいね！</button>
                        <input type="hidden" name="_token" value="${_token}" />

                    </form>
                </c:if>

                <c:if test="${sessionScope.login_user.id == post.user.id}">
                    <p><a href="<c:url value="/posts/edit?id=${post.id}" />">この投稿を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/posts/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>