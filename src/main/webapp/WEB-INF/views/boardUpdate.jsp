<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdate</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #updateForm {
            width: 600px;
        }
    </style>

</head>
<body>
<div class="container">
    <form action="/boardUpdate" method="post" name="updateForm">
        ID
        <input type="text" name="id" value="${updateResult.id}" class="form-control" readonly> <br>
        작성자
        <input type="text" name="boardWriter" value="${updateResult.boardWriter}" class="form-control" readonly> <br>
        비밀번호
        <input type="text" name="boardPass" id="inputPass" class="form-control"> <br>
        제목
        <input type="text" name="boardTitle" value="${updateResult.boardTitle}" class="form-control"> <br>
        내용
        <textarea name="boardContents" cols="30" rows="10" class="form-control">${updateResult.boardContents}</textarea>
        <br>
        <input type="button" value="수정 완료" class="btn btn-success" onclick="updateReqFn()">
        <a href="/" class="btn btn-dark">홈으로 가기</a>
    </form>
</div>
</body>
<script>
    const updateReqFn = () => {
        const passwordDB = '${updateResult.boardPass}';
        const inputPW = document.getElementById("inputPass").value;

        if (passwordDB == inputPW) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!")
        }

    }
</script>
</html>
