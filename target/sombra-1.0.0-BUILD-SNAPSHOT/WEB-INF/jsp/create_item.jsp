<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "mainHeader"> 
   <div class = "container ">
     <div class = "col-xs-12 clearfix">
		<ul class="nav nav-pills menu_li">
		  <li role="presentation"><a href="${pageContext.request.contextPath}/adminEditUser">User Edit</a></li>
		  <li role="presentation" ><a href="${pageContext.request.contextPath}/adminEditCities">Cities Edit</a></li>
		  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/adminCreateItem">Add Item</a></li>
		</ul>
    </div>
   </div>
</div>
<div class = "container">
	<div class = "row content_padding">
			<h1 class = "page_title_text" ><span class = "glyphicon glyphicon-th-large"></span> Create new lot</h1>
	</div>	
			<form:form class = "form-horizontal" action="${pageContext.request.contextPath}/createLot" method="post" modelAttribute="product">
				<div class="form-group ">
				    <label class="col-sm-3 control-label" for="name">Name: </label>
				    <div class="col-sm-4">
				    	<form:input type = "text" class="form-control" id="name" path="name" value = "${name}"/>
						<form:errors class = "register-user-error" path="name" />
				  	</div>
		        </div>
		        <div class="form-group">
				    <label class="col-sm-3 control-label" for="price">Price: </label>
				    <div class="col-sm-4">
				    	<form:input type = "text" class="form-control" id="price" path="price" value = "${price}"/>
						<form:errors class = "register-user-error" path="price" />
				  	</div>
		        </div>
		        <div class="form-group">
				    <label class="col-sm-3 control-label" for="description">Description: </label>
				    <div class="col-sm-4">
				    	<form:textarea value = "${description}" id="description" path="description" class="form-control" rows="3"/>
						<form:errors class = "register-user-error" path="description" />
				  	</div>
		        </div>
		        <div class="form-group">
				    <label class="col-sm-3 control-label" for="category">Category: </label>
				    <div class="col-sm-4">
				    	<form:select path="category" class="form-control">
							 <form:options items="${categories}" />
						</form:select>
				  	</div>
		        </div>
		         <div class="form-group">
				    <label class="col-sm-3 control-label" for="category">Location: </label>
				    <div class="col-sm-4">
				    	<form:select path="location" class="form-control">
							 <form:options items="${location}" />
						</form:select>
				  	</div>
		        </div>
                <div class="form-group">
				    <label class="col-sm-3 control-label" for="available">Available: </label>
				    <div class="col-sm-4">
				    <label class="radio-inline">
						<spring:bind path="inStock">
							<c:forEach items='${inStock}' var='inStock'>
								<c:choose>
									<c:when test="${inStock.key eq product.inStock}">
										<input type="radio" class = "radio_button" name="inStock" value="${inStock.key}" checked="checked">${inStock.value}
									</c:when>
									<c:otherwise>
										<input  type="radio" name="inStock" value="${inStock.key}">${inStock.value}
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</spring:bind>
					</label>
					<form:errors path="inStock" class = "register-user-error" />
				  	</div>
		        </div>
		        <div class="form-group">
				    <label class="col-sm-3 control-label" for="condition">Condition: </label>
				    <div class="col-sm-4">
				    	<form:input type = "text" value = "${condition}" id="condition" path="condition" class="form-control"/>
						<form:errors class = "register-user-error"	 path="condition" />
				  	</div>
		        </div>
		        <div class="form-group">
					<div class="col-sm-10 col-md-offset-3">
					    <button type="submit" class="btn btn-success">Save</button>
					    <a class="btn btn-default" href = "${pageContext.request.contextPath}/adminEditUser">Cancel</a>
				    </div>
				</div>
				</form:form> 		
</div><!-- container -->
<%-- 


<td colspan="3" align="center">

<table>
	<form:form action="${pageContext.request.contextPath}/createLot" method="post" modelAttribute="product">
			<tr>
				<td>
					<p>
						Name: <form:input path="name" value = "${name}"/>
						<form:errors id = "create-product-error-name" path="name" />
					</p>
					<p>
						Price: <form:input path="price" value = "${price}"/>
						<form:errors id = "create-product-error-price" path="price" />
					</p>
					<p>
						Description: <form:input path="description" value = "${description}"/>
						<form:errors id = "create-product-error-description" path="description" />
					</p>
					<p>Category:
						
							<form:select path="category">
								 <form:options items="${categories}" />
							</form:select>
						
					</p>
					<p>Location:
							<form:select path="location">
								 <form:options items="${location}" />
							</form:select>
						
					</p>
					<p>Available:
						<spring:bind path="inStock">
						<c:forEach items='${inStock}' var='inStock'>
							<c:choose>
								<c:when test="${inStock.key eq product.inStock}">
									<input type="radio" id = "create-product-error-check" name="inStock" value="${inStock.key}"	checked="checked">${inStock.value}
								</c:when>
								<c:otherwise>
									<input type="radio" id = "edit-user-role-check" name="inStock" value="${inStock.key}">${inStock.value}
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</spring:bind><p>
					<form:errors path="inStock" id = "edit-user-error-role" /></p>
					</p>
					<p>	Condition:<form:input path="condition" value = "${condition}"/>
						<form:errors id = "create-product-error-condition" path="condition" />
					</p>
				</td>
			</tr>
			<button type="submit" id = "edit-form-save-button"  class="btn  btn-primary"> Save </button>
			<a href="${pageContext.request.contextPath}/adminEditUser" class = "btn">Cancel</a>
		</form:form>
</table>
  
  
  
</td> --%>