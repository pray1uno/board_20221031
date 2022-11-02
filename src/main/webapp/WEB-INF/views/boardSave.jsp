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
        margin-top: 50px;
    }
</style>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="save-form">
    <form action="/board/save" method="post" name="saveForm" enctype="multipart/form-data">
<%--        파일 첨부 시 반드시 form 태그에 enctype="multipart/form-data 를 적용시켜 주어야 함
            파일 업로드는 반드시 post 타입이어야 함 --%>
        <input type="text" name="boardWriter" placeholder="작성자" class="form-control">
        <span id="writerCheck"></span> <br>
        <input type="text" name="boardPass" placeholder="비밀번호" class="form-control">
        <span id="passCheck"></span> <br>
        <input type="text" name="boardTitle" placeholder="제목" class="form-control">
        <span id="titleCheck"></span> <br>
        <textarea name="boardContents" cols="30" rows="10" placeholder="내용" class="form-control"></textarea>
        <span id="contentsCheck"></span> <br>
        <input type="file" class="form-control" name="boardFile">
<%--            name 값이 반드시 있어야 하고, DTO의 MultipartFile 필드 이름과 일치해야 함 --%>
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
