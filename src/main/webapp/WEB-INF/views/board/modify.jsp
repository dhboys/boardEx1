<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

<title>MODIFY</title>

<%@include file="../includes/header2.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<div>
		<h1>
			<span class="badge badge-pill badge-info">MODIFY PAGE</span>
		</h1>
	</div>


	<div class="form-group">
		<label for="exampleFormControlInput1">BNO</label> <input type="text" class="form-control bno" name="bno" value="<c:out value="${board.bno}"></c:out>" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="exampleFormControlInput1">TITLE</label> <input type="text"
			class="form-control" name="title"
			value="<c:out value="${board.title}"></c:out>">
	</div>

	<div class="form-group">
		<label for="exampleFormControlInput1">CONTENT</label> <input
			type="text" class="form-control" name="content"
			value="<c:out value="${board.content}"></c:out>">
	</div>

	<div class="form-group">
		<label for="exampleFormControlInput1">WRITER</label> <input
			type="text" class="form-control" name="writer"
			value="<c:out value="${board.writer}"></c:out>">
	</div>


	<div>

		<button type="button" class="btn btn-outline-dark modBtn">수정완료</button>
		<button type="button" class="btn btn-outline-dark canBtn">취소</button>
		<button type="button" class="btn btn-outline-dark listBtn">목록</button>
	</div>

	<form class="actionForm" action="/board/modify" method="post">
		<input type="hidden" name="page" value="${pageDTO.page}"> <input
			type="hidden" name="perSheet" value="${pageDTO.perSheet}"> <input
			type="hidden" name="type" value="${pageDTO.type}"> <input
			type="hidden" name="keyword" value="${pageDTO.keyword}">
	</form>

	<script>




const d = document
const dqs = d.querySelector.bind(document)
const actionForm = dqs(".actionForm")


// 목록으로

dqs(".listBtn").addEventListener("click" , function(e){
	
	actionForm.setAttribute("action" , "/board/list")
	actionForm.setAttribute("method" , "get")
	actionForm.submit()
} , false)

// cancel

dqs(".canBtn").addEventListener("click" , function(e){
	actionForm.setAttribute("action" , "/board/read")
	actionForm.setAttribute("method" , "get")
	actionForm.innerHTML += "<input type='hidden' name='bno' value='"+bno.value+"'>"
	actionForm.submit()
})

// 수정완료 버튼



	
function sendRegister(data){
		
	
		return fetch("/board/modify" ,  
				{ method : 'post',
			      headers : {'Content-Type':'application/json'},
			      body : JSON.stringify(data)
			      }
				)
			      .then(res => res.text())
			      .then(result => console.log(result))			     
		}

dqs(".modBtn").addEventListener("click" , function(e){
	
	const bno = dqs("input[name='bno']")
	const title = dqs("input[name='title']")
	const content = dqs("input[name='content']")
	const writer = dqs("input[name='writer']")
	
	const data = {bno:bno.value , title: title.value , content:content.value , writer:writer.value}

	
	console.log(data)

	sendRegister(data)
	
},false)
	



</script>
	<%@include file="../includes/footer.jsp"%>