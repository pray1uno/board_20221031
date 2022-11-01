<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<style>
    #save-form {
        width: 800px;
        padding-top: 50px;
    }
</style>
<body>
<div class="container" id="save-form">
    <form action="/board/save" method="post" name="saveForm">
        <input type="text" name="boardWriter" placeholder="작성자" class="form-control">
        <span id="writerCheck"></span> <br>
        <input type="text" name="boardPass" placeholder="비밀번호" class="form-control">
        <span id="passCheck"></span> <br>
        <input type="text" name="boardTitle" placeholder="제목" class="form-control">
        <span id="titleCheck"></span> <br>
        <input type="text" name="boardContents" placeholder="내용" class="form-control">
        <span id="contentsCheck"></span> <br>
        <input type="button" value="작성완료" onclick="setup()" class="btn btn-primary">
    </form>
</div>
</body>
<script>
    const setup = () => {
        console.log("함수 호출")
        if (document.saveForm.boardWriter.value == "") {
            const writerCheck = document.getElementById("writerCheck");
            writerCheck.innerHTML = "작성자를 입력해 주세요.";
            writerCheck.style.color = "red";
            return false;
        } else if (document.saveForm.boardPass.value == "") {
            const passCheck = document.getElementById("passCheck");
            passCheck.innerHTML = "비밀번호를 입력해 주세요.";
            passCheck.style.color = "red";
            return false;
        } else if (document.saveForm.boardTitle.value == "") {
            const titleCheck = document.getElementById("titleCheck");
            titleCheck.innerHTML = "제목을 입력해 주세요.";
            titleCheck.style.color = "red";
            return false;
        } else if (document.saveForm.boardContents.value == "") {
            const contentsCheck = document.getElementById("contentsCheck");
            contentsCheck.innerHTML = "내용을 입력해 주세요.";
            contentsCheck.style.color = "red";
            return false;
        }
        document.saveForm.submit();
    }
</script>
</html>
