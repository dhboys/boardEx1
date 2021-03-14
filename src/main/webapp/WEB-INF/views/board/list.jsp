<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

    <title>List</title>
    
    <%@include file="../includes/header2.jsp" %>

    <!-- Begin Page Content -->
                <div class="container-fluid">
                
                
                
                <!-- Modal -->
<div id="searchModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>검색조건이 잘못되었습니다</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info rounded-pill" data-dismiss="modal" onclick="movePage()">확인</button>
      </div>
    </div>
  </div>
</div>                
                
                

<div>
<select class="form-select form-select-sm stype" aria-label=".form-select-sm example">
  <option value="" >---------</option>
  <option value="t" >제목</option>
  <option value="c" >내용</option>
  <option value="w">작성자</option>
  <option value="tc">제목/내용</option>
  <option value="tcw">제목/내용/작성자</option>
</select>

 <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light bordered small" placeholder="무엇을 검색하시겠습니까?"
                                 name="skeyword">
                            <div class="input-group-append">
                                <button class="btn btn-dark" type="button">
                                    <i class="fas fa-search fa-sm sBtn"></i>
                                </button>
                            </div>
                        </div>
                    </form>


</div>

<div>
<h2><button type="button" class="btn btn-info rounded-pill regBtn">게시물등록</button></h2>
</div>


<div>
 <table class="table table-bordered">
  <thead class="thead-dark">
    <tr>
     <th scope="col">BNO</th>
      <th scope="col">TITLE</td>
      <th scope="col">CONTENT</td>
      <th scope="col">WRITER</td>
      <th scope="col">REGDATE</th>
      <th scope="col">UPDATEDATE</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="board">
    <tr>
      <th scope="row">${board.bno}</th>
      <td><a class="rBtn" href="<c:out value="${board.bno }"></c:out>"><c:out value="${board.title }"></c:out></a></td>
      <td><c:out value="${board.content }"></c:out></td>
      <td><c:out value="${board.writer }"></c:out></td>
      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.regdate }"/></td>
      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.updateDate }"/></td>
    </tr>
  </c:forEach>  
  </tbody>
</table>
</div>               
    <ul class="pagination">
    <c:if test="${pageMaker.prev }">
    <li class="page-item">
      <a class="page-link" href="${pageMaker.start - 1 }" tabindex="-1">이전페이지</a>
    </li>
    </c:if>
    
    <c:forEach begin="${pageMaker.start }" end="${pageMaker.end }" var="num">
    <li class="page-item ${num == pageMaker.pageDTO.page? "active":""  }"><a class="page-link" href="${num }">${num }</a></li>
    </c:forEach>
    
    <c:if test="${pageMaker.next }">
    <li class="page-item">
      <a class="page-link" href="${pageMaker.end + 1 }">다음페이지</a>
    </li>
     </c:if>
  </ul>
  
  <form class="actionForm" action="/board/list" method="get">
  	<input type="hidden" name="page" value="${pageDTO.page}">
  	<input type="hidden" name="perSheet" value="${pageDTO.perSheet}">
  	<input type="hidden" name="type" value="${pageDTO.type}">
  	<input type="hidden" name="keyword" value="${pageDTO.keyword}">
  </form>
  
  
  
  <script>
  
  const d = document
  const dqs = d.querySelector.bind(document)
  const actionForm = dqs(".actionForm")
  // pagination -------------------------------------------
      document.querySelector(".pagination").addEventListener("click" , function(e) {
	  e.stopPropagation()
	  e.preventDefault()
	  const target = e.target
	  const pageNum = target.getAttribute("href")
	  
	  if( pageNum != null) {
	  
	  dqs(".actionForm input[name='page']").value = pageNum
	  dqs(".actionForm").submit()
	  }
  } , false)
  

  
  
    // 검색 -------------------------------------------
    
    dqs(".sBtn").addEventListener("click" , function(e){
    	
    	const target = e.target
    	
    	const type = dqs(".stype").value
    	
    	const keyword = dqs("input[name='skeyword']").value
    	
    	if(keyword == null){
    		console.log("--")
    		$("#searchModal").modal("show")
    		
    	}
    	
    	
    	//console.log(type)
    	//console.log(keyword)
    	
    	dqs(".actionForm input[name='page']").value = 1
    	
    	dqs(".actionForm input[name='type']").value = type
    	
    	dqs(".actionForm input[name='keyword']").value =
    		dqs("input[name='skeyword']").value
    		
    		
	
    	actionForm.submit()

    } , false)
    
     // 조회 -------------------------------------------
     d.querySelectorAll(".rBtn").forEach(a => {
    	 a.addEventListener("click" , function(e) {
    		 e.preventDefault()
    		 
    		const bno = e.target.getAttribute("href")
    		
    		actionForm.setAttribute("action" , "/board/read")
    		actionForm.innerHTML += "<input type='hidden' name='bno' value='"+bno+"'>"
    		actionForm.submit()
    	 },false)
     })
     
     // 등록페이지로
     d.querySelector(".regBtn").addEventListener("click" , function(e){
    	
    	 actionForm.setAttribute("action" , "/board/register")
    	 actionForm.submit()
    	 
     })
    	 

  
  </script>
  

<%@include file="../includes/footer.jsp" %>