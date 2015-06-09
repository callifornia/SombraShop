<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "mainHeader"> 
   <div class = "container ">
     <div class = "col-xs-12 clearfix">
		<ul class="nav nav-pills menu_li">
		  <li role="presentation"><a href="${pageContext.request.contextPath}/adminEditUser">User Edit</a></li>
		  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/adminEditCities">Cities Edit</a></li>
		  <li role="presentation"><a href="${pageContext.request.contextPath}/adminCreateItem">Add Item</a></li>
		</ul>
    </div>
   </div>
</div>
<div class = "container">
		<div class = "row content_padding">
			<h1 class = "page_title_text" ><span class = "glyphicon glyphicon-edit"></span> City edit</h1>
			<div class = "col-sm-4 col-sm-offset-4 table_city">
				<form:form class="form-inline" name="city" action="${pageContext.request.contextPath}/insertCity" method = "POST" modelAttribute="city">
					<div class="form-group ">
					    <label class = "control-label"  for="city">City name: </label>
				    	<form:input placeholder = "Enter city name" path="name" value = "${name}" type = "text" class="form-control" id="city"/>
			        </div>
		            <button type="submit" class="btn btn-success"> Add </button>
				</form:form> 		
			</div>
		</div>

	<div class = "row">
		<div class = "col-sm-4 col-sm-offset-4">
			<table class="table table-hover">
		      <thead>
		        <tr>
		          <th>id</th>
		          <th>Name</th>
		          <th>Action</th>
		        </tr>
		      </thead>
		      <tbody>
			      <c:forEach var="city" items="${cities}">
					<tr>
						<td>${city.id}</td>
						<td>${city.name}</td>
						<td>
							<a href="${pageContext.request.contextPath}/deleteCity/${city.id}">
								<span class = "glyphicon glyphicon-remove"></span>
							</a>
						</td>
					</tr>
				 </c:forEach> 
               </tbody>
		    </table>
	    </div>
	   </div>
</div> <!-- container -->
<div class = "row" align="center">
		<nav>
			<ul class="pagination">
				<c:if test="${not empty pagi.previousPage }">
					<li><a href="${pageContext.request.contextPath}/adminEditCities/${pagi.previousPage}">Previous</a></li>
				</c:if>
				<c:forEach items="${pagi.pageList}" var="page">
					<c:choose>
						<c:when test="${pagi.currentPage == page}">
							<li class="active"><a href="#">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/adminEditCities/${page}">${page} </a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${not empty pagi.nextPage}">
					<li><a href="${pageContext.request.contextPath}/adminEditCities/${pagi.nextPage}">Next</a></li>
				</c:if>
			</ul>
			</nav>
		</div>
