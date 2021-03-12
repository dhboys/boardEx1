<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>

    <title>REGISTER</title>
    
    <%@include file="../includes/header2.jsp" %>

    <!-- Begin Page Content -->
                <div class="container-fluid">
                
				<div>
                	<h1><span class="badge badge-pill badge-info">REGISTER PAGE</span></h1>
				</div>
                  
  <div class="form-group">
    <label for="exampleFormControlInput1">TITLE</label>
    <input type="text" class="form-control title" name="title">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlInput1">CONTENT</label>
    <input type="text" class="form-control content" name="content">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlInput1">WRITER</label>
    <input type="text" class="form-control writer" name="writer" >
  </div>


<div>
<button type="button" class="btn btn-outline-dark regBtn">등록</button>
<button type="button" class="btn btn-outline-dark canBtn">취소</button>

</div>

<form class="actionForm" action="/board/register" method="post">
  	<input type="hidden" name="page" value="${pageDTO.page}">
  	<input type="hidden" name="perSheet" value="${pageDTO.perSheet}">
  	<input type="hidden" name="type" value="${pageDTO.type}">
  	<input type="hidden" name="keyword" value="${pageDTO.keyword}">
</form>

<script>




const d = document
const dqs = d.querySelector.bind(document)
const actionForm = dqs(".actionForm")
// const toGet = actionForm.setAttribute("method" , "get")

const title = dqs("input[name='title']")
const content = dqs("input[name='content']")
const writer = dqs("input[name='writer']")

// 등록...............................................


function sendRegister(data){
		
		return fetch("/board/register" ,  
				{ method : 'post',
			      headers : {'Content-Type':'application/json'},
			      body : JSON.stringify(data)
			      }
				)
			      .then(res => res.text())
			      
			      			     
		}

dqs(".regBtn").addEventListener("click" , function(e){
	

	const data = {title: title.value , content:content.value , writer:writer.value}
	
	console.log(data)
	
	//sendRegister(data)

	const fnResult = sendRegister(data)
	
	fnResult.then(result => {
		
		console.log("RESULT: " + result)
		
	})
	
},false)


// 목록으로

dqs(".canBtn").addEventListener("click" , function(e){
	console.log("...")
	actionForm.setAttribute("method" , "get")
	actionForm.setAttribute("action" , "/board/list")
	actionForm.submit()
} , false)


</script>        
<%@include file="../includes/footer.jsp" %>    