<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

<title>MODIFY</title>

<%@include file="../includes/header2.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">


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
        <p>수정하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info rounded-pill modifyBtn" data-dismiss="modal" onclick="movePage()">확인</button>
        <button type="button" class="btn btn-dark rounded-pill hideBtn" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


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

	const bno = dqs("input[name='bno']")
	const title = dqs("input[name='title']")
	const content = dqs("input[name='content']")
	const writer = dqs("input[name='writer']")
	
	const type = dqs("input[name='type']").value  	
	const keyword = dqs("input[name='keyword']").value
	
	
function movePage(){
	
	const data = {bno:bno.value , title: title.value , content:content.value , writer:writer.value}
		
	function sendModify(data){
		
		
		return fetch("/board/modify" ,  
				{ method : 'post',
			      headers : {'Content-Type':'application/json'},
			      body : JSON.stringify(data)
			      }
				)
			      .then(res => res.text())
			      			     
		}
	

	console.log(data)

	const fnResult = sendModify(data)
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

// hideBtn

dqs(".hideBtn").addEventListener("click" , function(e){

	$("#registerModal").modal("hide")
	
} , false)



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


dqs(".modBtn").addEventListener("click" , function(e){
	console.log("------")
	
	
	
	$("#registerModal").modal("show")
	
},false)
	



</script>
	<%@include file="../includes/footer.jsp"%>