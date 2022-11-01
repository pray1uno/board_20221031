<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>

<button class="btn btn-primary" onclick="newFn()">신규 글 작성</button>
<button class="btn btn-dark" onclick="listFn()">글 목록 조회</button>
</body>
<script>
    const newFn = () => {
        location.href = "/board/save";
    }
    const listFn = () => {
        location.href = "/board/";
    }

</script>
</html>
