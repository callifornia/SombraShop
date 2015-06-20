<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "container">
	<div class = "row content_padding">
		<div class="col-sm-10 col-md-offset-3">
			<h1 class = "page_title_text"><span class = "glyphicon glyphicon-user checkout_button"></span> Register user</h1>
	    </div>
    </div>
    <form:form class = "form-horizontal" name="registerForm" action="${pageContext.request.contextPath}/insert-user" method = "POST" modelAttribute="user">
		<div class="form-group">
		    <label class="col-sm-3 control-label" for="login">Login: </label>
		    <div class="col-sm-4">
		  		<form:input placeholder="Enter login" type = "text" class="form-control" id="login" path="login" value = "${login}" />			
				<form:errors  class = "register-user-error" path="login" />
		  	</div>
        </div>
		<div class="form-group">
		    <label class="col-sm-3 control-label" for="password">Password: </label>
		    <div class="col-sm-4">
		  		<form:input placeholder="Enter password" type = "password" class="form-control" id="password" path="password" value = "${password}" />			
				<form:errors  class = "register-user-error" path="password" />
		  	</div>
        </div>
		<div class="form-group">
		    <label class="col-sm-3 control-label" for="email">E-mail: </label>
		    <div class="col-sm-4">
		  		<form:input placeholder="Email" id ="email" type = "text" class="form-control" path="email" value = "${email}" />			
				<form:errors  class = "register-user-error" path="email" />
		  	</div>
        </div>
		<div class="form-group">
		    <label class="col-sm-3 control-label" for="phone">Phone: </label>
		    <div class="col-sm-4">
		  		<form:input placeholder="Phone" id = "phone" type = "text" class="form-control" path="phone" value = "${phone}" />			
				<form:errors  class = "register-user-error" path="phone" />
		  	</div>
        </div>
		<div class="form-group">
		    <label class="col-sm-3 control-label" for="firstName">First Name: </label>
		    <div class="col-sm-4">
		  		<form:input id = "firstName" placeholder="First name" type = "text" class="form-control" path="firstName" value = "${firstName}" />			
				<form:errors  class = "register-user-error" path="firstName" />
		  	</div>
        </div>
		<div class="form-group">
		    <label class="col-sm-3 control-label" for="lastName">Last Name: </label>
		    <div class="col-sm-4">
		  		<form:input id = "lastName" placeholder="Last name" type = "text" class="form-control" path="lastName" value = "${lastName}" />			
				<form:errors  class = "register-user-error" path="lastName" />
		  	</div>
        </div>
		<div class="form-group">
		    <div class="col-sm-10 col-md-offset-3">
		      <button type="submit" class="btn btn-success">Sign in</button>
		      <button type="submit" class="btn btn-default">Cancel</button>
		    </div>
		  </div>
	</form:form> 
	</div>
