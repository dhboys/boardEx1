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
	
	
	<!------------------------------------------- Modal --------------------------------------->
	  <div id="registerModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info rounded-pill deleteBtn" data-dismiss="modal" onclick="movePage()">삭제</button>
        <button type="button" class="btn btn-dark rounded-pill hideBtn" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
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

<ul>


</ul>


	<script>
	
	
	
	
	
	const d = document
	const dqs = d.querySelector.bind(document)
	const actionForm = dqs(".actionForm")
	const bno = dqs(".bno").getAttribute('value')
	
	const type = dqs("input[name='type']").value  	
	const keyword = dqs("input[name='keyword']").value
	
	function movePage(){
		
		function sendRemove(bno) {

			return fetch('/board/remove', {
				method : 'post',
				headers : { 'Content-Type' : 'application/json'},
				body : JSON.stringify(bno)
			}).then(res => res.text())
			  
		}
		
		const fnResult = sendRemove(bno)
		fnResult.then(result => {
			console.log(result)
		})
		
		if(type == '' && keyword == ''){
	  		dqs(".actionForm input[name='type']").remove()
	  		dqs(".actionForm input[name='keyword']").remove()
	  	}
		
		dqs(".actionForm input[name='page']").value = 1
			actionForm.setAttribute("method", "get")
			actionForm.setAttribute("action", "/board/list")
			actionForm.submit()
	}

	// 삭제페이지 취소

	dqs(".hideBtn").addEventListener("click" , function(e){
		
		if(type == '' && keyword == ''){
	  		dqs(".actionForm input[name='type']").remove()
	  		dqs(".actionForm input[name='keyword']").remove()
	  	}
		
		e.target.modal("hide")
		
	})
	

		// delete...............................................

	/* 	const d = document
		const dqs = d.querySelector.bind(document)
		const actionForm = dqs(".actionForm") */
		// const toGet = actionForm.setAttribute("method" , "get")

		// delete...............................................
		/* const bno = dqs(".bno").getAttribute('value')

		 dqs(".delBtn").addEventListener("click" , function(e){
		
		 actionForm.setAttribute("action" , "/board/remove")
		 actionForm.setAttribute("method" , "post")
		 actionForm.innerHTML += "<input type='hidden' name='bno' value='"+bno+"'>"
		 actionForm.submit()
		
		 } , false) */

		
		
			
		
		dqs(".delBtn").addEventListener("click", function(e) {

			$("#registerModal").modal("show")
		
			
		} , false)

		// 목록으로

		dqs(".listBtn").addEventListener("click", function(e) {

			if(type == '' && keyword == ''){
		  		dqs(".actionForm input[name='type']").remove()
		  		dqs(".actionForm input[name='keyword']").remove()
		  	}
			
			actionForm.setAttribute("action", "/board/list")
			actionForm.submit()
		}, false)

		dqs(".modBtn").addEventListener("click",function(e) {
			
			if(type == '' && keyword == ''){
		  		dqs(".actionForm input[name='type']").remove()
		  		dqs(".actionForm input[name='keyword']").remove()
		  	}
							
							actionForm.setAttribute("action", "/board/modify")
							actionForm.innerHTML += "<input type='hidden' name='bno' value='"+bno+"'>"
							actionForm.submit()
						}, false)
	</script>
	<%@include file="../includes/footer.jsp"%>