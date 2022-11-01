<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>boardList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <table class="table table-striped table-hover">
        <tr>
            <th>글 번호</th>
            <th>작성자</th>
            <th>비밀번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성 시간</th>
            <th>상세조회</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${listResult}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardPass}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardCreatedDate}</td>
                <td><a href="/board?id=${board.id}">상세조회</a></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="/">홈으로 가기</a>
</div>
</body>

</html>
