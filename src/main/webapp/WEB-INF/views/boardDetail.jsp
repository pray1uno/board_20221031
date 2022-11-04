<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>boardDetail</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        #controlForm {
            width: 800px;
        }

        #comment-write {
            width: auto;
            margin: auto;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="controlForm">
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
        <c:if test="${listResult.storedFileName != null}">
            <tr>
                <th>첨부파일</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${listResult.storedFileName}"
                         alt="" width="100" height="100">
                </td>
            </tr>
        </c:if>
        <tr>
            <th>수정/삭제</th>
            <td id="button-form">
                <button class="btn btn-primary" onclick="boardUpdate()">수정</button>
                <button class="btn btn-danger" onclick="boardDelete()">삭제</button>
                <button class="btn btn-success" onclick="boardReturn()">목록</button>
            </td>
        </tr>
    </table>

    <div class="container mt-5">
        <div id="comment-write" class="input-group mb-3">
            <div class="form-floating">
                <input type="text" id="commentWriter" class="form-control" placeholder="작성자">
                <label for="commentWriter">작성자</label>
            </div>
            <div class="form-floating">
                <input type="text" id="commentContents" class="form-control" placeholder="내용">
                <label for="commentContents">내용</label>
            </div>
            <button id="comment-write-btn" class="btn btn-secondary" onclick="commentWrite()">댓글 작성</button>
        </div>
    </div>
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
        const page = '${page}'
        location.href = "/board/paging?page=" + page;

    }

    const commentWrite = () => {

        const commentId = '${listResult.id}'
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;

        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                boardId: commentId,
                commentWriter: writer,
                commentContents: contents
                //    key 값은 DTO의 필드명과 일치해야함
            },
            dataType: "json", // 리턴타입
            success: function (commentList) {
                console.log(commentList);
            },
            error: function () {
                console.log("실패");
            }
        });
    }
</script>
</html>
