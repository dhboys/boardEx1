<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

<title>READ</title>

<%@include file="../includes/header2.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<div>
		<h1>
			<span class="badge badge-pill badge-info">READ PAGE</span>
		</h1>
	</div>




	<div class="form-group">
		<label for="exampleFormControlInput1">BNO</label> <input type="text"
			class="form-control bno" name="title"
			value="<c:out value="${board.bno}"></c:out>" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="exampleFormControlInput1">TITLE</label> <input type="text"
			class="form-control" name="title"
			value="<c:out value="${board.title}"></c:out>" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="exampleFormControlInput1">CONTENT</label> <input
			type="text" class="form-control" name="title"
			value="<c:out value="${board.content}"></c:out>" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="exampleFormControlInput1">WRITER</label> <input
			type="text" class="form-control" name="title"
			value="<c:out value="${board.writer}"></c:out>" readonly="readonly">
	</div>


	<div>
		<button type="button" class="btn btn-outline-dark modBtn">수정</button>
		<button type="button" class="btn btn-outline-dark delBtn">삭제</button>
		<button type="button" class="btn btn-outline-dark listBtn">목록</button>
	</div>

	<form class="actionForm" action="/board/modify" method="get">
		<input type="hidden" name="page" value="${pageDTO.page}"> <input
			type="hidden" name="perSheet" value="${pageDTO.perSheet}"> <input
			type="hidden" name="type" value="${pageDTO.type}"> <input
			type="hidden" name="keyword" value="${pageDTO.keyword}">
	</form>

	<script>
		// delete...............................................

		const d = document
		const dqs = d.querySelector.bind(document)
		const actionForm = dqs(".actionForm")
		// const toGet = actionForm.setAttribute("method" , "get")

		// delete...............................................
		/* const bno = dqs(".bno").getAttribute('value')

		 dqs(".delBtn").addEventListener("click" , function(e){
		
		 actionForm.setAttribute("action" , "/board/remove")
		 actionForm.setAttribute("method" , "post")
		 actionForm.innerHTML += "<input type='hidden' name='bno' value='"+bno+"'>"
		 actionForm.submit()
		
		 } , false) */

		const bno = dqs(".bno").getAttribute('value')
		

			function sendRemove(bno) {

				return fetch('/board/remove', {
					method : 'post',
					headers : { 'Content-Type' : 'application/json'},
					body : JSON.stringify(bno)
				}).then(res => res.text())
				  .then(result => console.log(result))

			}
		
		dqs(".delBtn").addEventListener("click", function(e) {

			
			sendRemove(bno)
			
			location.href = "http://"
			
		})

		// 목록으로

		dqs(".listBtn").addEventListener("click", function(e) {

			actionForm.setAttribute("action", "/board/list")
			actionForm.submit()
		}, false)

		dqs(".modBtn")
				.addEventListener(
						"click",
						function(e) {

							actionForm.setAttribute("action", "/board/modify")
							actionForm.innerHTML += "<input type='hidden' name='bno' value='"+bno+"'>"
							actionForm.submit()
						}, false)
	</script>
	<%@include file="../includes/footer.jsp"%>