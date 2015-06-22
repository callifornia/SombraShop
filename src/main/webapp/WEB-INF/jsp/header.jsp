<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class="navbar">
      <div class="container">
          <div class = "col-md-3 header_left_side">
          <a  href="${pageContext.request.contextPath}">
          	<img alt="logo" id = "logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
          </a>
          	<!-- <p class = "logo_title">Sombra</p> -->
          </div>
           <div class = "col-md-6 search_form">    
	           <form:form role="search" name="searchForm" action="${pageContext.request.contextPath}/search" method="POST" modelAttribute="search">
			   	 <div class="col-md-12">
				 	<div class="input-group">
						<form:input class="form-control" placeholder="Search by product name..."  path="searchRow" id="appendedInputButton"	size="16" type="text" name="name" />
						 <span class="input-group-btn">
	                         <button class="btn btn-default" type="submit">Search</button>
	                     </span>
					</div><!-- /input-group -->
               	 </div><!-- /.col-lg-6 -->
			    </form:form>
   
            </div>
            <div class = "col-md-3 header_right_panel">
            <ul class="nav navbar-nav navbar-right">
	            <security:authorize access="isAnonymous()">
		              <li><a href="<c:url value="/join-create" />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		              <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	            </security:authorize>
	            <security:authorize access="hasRole('ROLE_ADMIN')">
					  <li> <a href="${pageContext.request.contextPath}/adminEditUser"><span class="glyphicon glyphicon-cog"></span> Admin profile</a></li>
					  <li> <a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout </a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_REGULAR_USER')">
					  <li><a href="${pageContext.request.contextPath}/cart"><span class = "glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
					  <li><a href="${pageContext.request.contextPath}/logout"><span class = "glyphicon glyphicon-log-out"></span> Logout </a></li>
					</security:authorize>      
            </ul>  
            </div> 
     </div><!-- /.container -->
</div>
