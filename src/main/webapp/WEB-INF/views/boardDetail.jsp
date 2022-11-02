<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardDetail</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>

    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <a href="/">홈으로 가기</a>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <td>${listResult.id}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${listResult.boardWriter}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>${listResult.boardPass}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${listResult.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${listResult.boardContents}</td>
        </tr>
        <tr>
            <th>작성 시간</th>
            <td>${listResult.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${listResult.boardHits}</td>
        </tr>
        <tr>
            <th>수정/삭제</th>
            <td id="button-form">
                <button class="btn btn-primary" onclick="boardUpdate()">수정</button>
                <button class="btn btn-danger" onclick="boardDelete()">삭제</button>
                <button class="btn btn-success" onclick="boardReturn()">목록</button>
            </td>
        </tr>
    </table>
</div>

</body>
<script>
    const boardDelete = () => {
        location.href = "/board/deleteForm?id=" + '${listResult.id}';
    }

    const boardUpdate = () => {
        const result = '${listResult.id}';
        location.href = "/boardUpdate?id=" + result;

    }

    const boardReturn = () => {
        location.href = "/board/";

    }
</script>
</html>
