<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "container">
	<div class = "row">
		<div class = "row content_padding">
			<div class="col-sm-10">
				<h1 class = "page_title_text"><span class = "glyphicon glyphicon-user"></span> Edit user</h1>
		    </div>
	    </div>
	    <form:form class = "form-horizontal" action="${pageContext.request.contextPath}/update" method = "POST" modelAttribute="user">
			<div class="form-group">
			    <label class="col-sm-3 control-label" for="id">Id: </label>
			    <div class="col-sm-4">
			    	<form:input type = "text" class="form-control" id="id" path="id" value = "${id}" readonly="true"/>
			  	</div>
	        </div>
			<div class="form-group">
			    <label class="col-sm-3 control-label" for="login">Login: </label>
			    <div class="col-sm-4">
			  		<form:input type = "text" class="form-control" id="login" path="login" value = "${login}" readonly="true" />			
			  	</div>
	        </div>
			<div class="form-group">
			    <label class="col-sm-3 control-label" for="phone">Phone: </label>
			    <div class="col-sm-4">
			  		<form:input id ="phone" type = "text" class="form-control" path="phone" value = "${phone}" />			
					<form:errors class = "register-user-error" path="phone" />
			  	</div>
	        </div>
			<div class="form-group">
			    <label class="col-sm-3 control-label" for="firstName">First name: </label>
			    <div class="col-sm-4">
			  		<form:input id = "firstName" type = "text" class="form-control" path="firstName" value = "${firstName}" />			
					<form:errors  class = "register-user-error" path="firstName" />
			  	</div>
	        </div>
	        <div class="form-group">
			    <label class="col-sm-3 control-label" for="firstName">Last name: </label>
			    <div class="col-sm-4">
			  		<form:input id = "lastName" type = "text" class="form-control" path="lastName" value = "${lastName}" />			
					<form:errors  class = "register-user-error" path="lastName" />
			  	</div>
	        </div>
	        <div class="form-group">
			    <label class="col-sm-3 control-label" for="firstName">E-mail: </label>
			    <div class="col-sm-4">
			  		<form:input id = "email" type = "text" class="form-control" path="email" value = "${email}" />			
					<form:errors  class = "register-user-error" path="email" />
			  	</div>
	        </div>
			<div class="form-group">
			    <div class="col-sm-10 col-md-offset-3">
			      <button type="submit" class="btn btn-success">Save</button>
			      <a class="btn btn-default" href = "${pageContext.request.contextPath}/adminEditUser">Cancel</a>
			    </div>
			</div>
		</form:form> 
	</div>
</div>