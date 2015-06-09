<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "container">
			<c:choose>
				<c:when test="${SPRING_SECURITY_LAST_EXCEPTION != null }">
					<div class = "row" >
				     <div class="col-sm-5 col-sm-offset-3" >
						<div class="alert alert-warning alert-dismissible" role="alert">
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						  <strong>Invalid user name or password
						</div>
			</div>
		</div>
				</c:when>								
			</c:choose>
	<form class="form-horizontal" name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2  col-sm-offset-2 control-label ">Login</label>
		    <div class="col-sm-3">
				<input class="form-control" placeholder="Enter login" type='text' name='j_username' value=''>
		    </div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label col-sm-offset-2">Password</label>
		    <div class="col-sm-3">
				<input class="form-control" id="inputPassword3" placeholder="Enter password" type='password' name='j_password' />
		    </div>
		</div>
	  <div class="form-group">
	    <div class="col-sm-offset-4 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox"> Remember me
	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-4 col-sm-10">
	      <button type="submit" class="btn btn-default">Sign in</button>
	    </div>
	  </div>
	</form>
	</div>
</div>
