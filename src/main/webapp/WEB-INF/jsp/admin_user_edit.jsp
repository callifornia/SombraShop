<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "mainHeader"> 
   <div class = "container ">
     <div class = "col-xs-12 clearfix">
		<ul class="nav nav-pills menu_li">
		  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/adminEditUser">User Edit</a></li>
		  <li role="presentation"><a href="${pageContext.request.contextPath}/adminEditCities">Cities Edit</a></li>
		  <li role="presentation"><a href="${pageContext.request.contextPath}/adminCreateItem">Add Item</a></li>
		</ul>
    </div>
   </div>
</div>
<div class = "container">
	<div class = "row content_padding">
		<h1 class = "page_title_text" ><span class = "glyphicon glyphicon-edit"></span> User edit</h1>
		<table class="table table-hover">
	      <thead>
	        <tr>
	          <th>id</th>
	          <th>Login</th>
	          <th>Email</th>
	          <th>Phone</th>
	          <th>First name</th>
	          <th>Last name</th>
	          <th>Active status</th>
	          <th>Role</th>
	          <th>Action</th>
	        </tr>
	      </thead>
	      <tbody>
	      <c:forEach var="user" items="${users}">
			<tr>
				<td>${user.id}</td>
				<td>${user.login}</td>
				<td>${user.email}</td>
				<td>${user.phone }</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<c:choose>
					<c:when test="${user.enable == true }">
						<td>живой</td>
					</c:when>
					<c:when test="${user.enable == false }">
						<td>казнен</td>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${user.role == 'ROLE_ADMIN' }">
						<td>admin</td>
					</c:when>
					<c:when test="${user.role == 'ROLE_REGULAR_USER' }">
						<td>user</td>
					</c:when>
					<c:otherwise>
						<td>unknown role</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${user.enable == false }">
						<td align = "center"><a href="${pageContext.request.contextPath}/recovery/${user.id}"><span class = "glyphicon glyphicon-refresh"></span></a></td>
					</c:when>
					<c:otherwise>
						<td align="center">
							<a href="${pageContext.request.contextPath}/userEdit/${user.id}">
								<span class = "glyphicon glyphicon-pencil"></span>
							</a> 
							<a href="${pageContext.request.contextPath}/delete//${user.id}">
								<span class = "glyphicon glyphicon-trash"></span>
							</a>
						</td>
					</c:otherwise>
				</c:choose>
			</c:forEach> 
			</tr>
      		</tbody>
    </table>
	</div>
	</div>
		<div class = "row" align="center">
		<nav>
			<ul class="pagination">
				<c:if test="${not empty pagi.previousPage }">
					<li><a href="${pageContext.request.contextPath}/adminEditUser/${pagi.previousPage}">Previous</a></li>
				</c:if>
				<c:forEach items="${pagi.pageList}" var="page">
					<c:choose>
						<c:when test="${pagi.currentPage == page}">
							<li class="active"><a href="#">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/adminEditUser/${page}">${page} </a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${not empty pagi.nextPage}">
					<li><a href="${pageContext.request.contextPath}/adminEditUser/${pagi.nextPage}">Next</a></li>
				</c:if>
			</ul>
			</nav>
		</div>