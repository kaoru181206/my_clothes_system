<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="purchase_date">購入日</label>
<input type="date" name="purchase_date" value="<fmt:formatDate value='${post.purchase_date}' pattern='yyyy-MM-dd' />" />
<br ><br />

<label for="name">ユーザー名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br /><br />

<label for="brandName">ブランド名</label><br />
<input type="text" name="brandName" value="${post.brandName}" />
<br /><br />

<label for="price">値段</label><br />
<input type="text" name="price" value="${post.price}" />
<br /><br />

<label for="category">カテゴリー</label><br />
<select name="category">
    <option value="0"<c:if test="${post.category == 0}"> select</c:if>>アウター</option>
    <option value="1"<c:if test="${post.category == 1}"> select</c:if>>トップス</option>
    <option value="2"<c:if test="${post.category == 2}"> select</c:if>>パンツ</option>
    <option value="3"<c:if test="${post.category == 3}"> select</c:if>>スニーカー</option>
    <option value="4"<c:if test="${post.category == 4}"> select</c:if>>小物類</option>
</select>
<br /><br />

<label for="content">コーディネート</label><br />
<textarea name="content" rows="10" cols="50">${post.content}</textarea>
<br /><br />

<label for="post_flag">投稿方法</label><br />
<select name="post_flag">
    <option value="0"<c:if test="${post.post_flag == 0}">select</c:if>>共有</option>
    <option value="1"<c:if test="${post.post_flag == 1}">select</c:if>>共有しない</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>
