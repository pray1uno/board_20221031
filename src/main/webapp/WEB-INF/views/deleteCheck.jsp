<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #delete-Check {
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="delete-Check">
    <form action="/board/delete" method="get" name="deleteForm">
        <input type="text" name="boardPass" class="form-control" placeholder="비밀번호 확인"
               id="inputPass"> <br>
        <input type="button" value="확인" onclick="deleteFn()">
    </form>
</div>
</form>
</body>
<script>
    const deleteFn = () => {
        const inputPass = document.getElementById("inputPass").value;
        const dbPass = '${checkResult.boardPass}'
        console.log(dbPass);

        if (inputPass == dbPass) {
            location.href = "/board/delete?id=" + '${checkResult.id}';
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>
