<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "container">
	<div class = "row">
		<div class = "media">
			<div class = "media-left lot_view" align="center">
				<c:if test="${empty lot.img }">
				        <img id = "general-page-product-img" class="img-rounded" src="${pageContext.request.contextPath}/resources/img/product/empty_product.png" alt="...">
			      	</c:if>
			      	<c:if test="${not empty lot.img }">
				        <img class="img-rounded" src="${pageContext.request.contextPath}/resources/img/product/${lot.img}.png" alt="...">
			      	</c:if>
			    <security:authorize access="hasRole('ROLE_REGULAR_USER')">
					<c:if test="${!productExist}">
						  <a id = "lot_${lot.id}" href="#" class="btn btn-success btn-lg buy_btn" onclick="send(${lot.id})"><span class = "glyphicon glyphicon-shopping-cart"></span> Buy </a>
					</c:if>
				</security:authorize>
			</div>
			<div class = "media-body">
				<h1 >${lot.name}</h1>
				<c:choose> 
					<c:when test="${lot.inStock}">
					<span class="label label-success">Available</span> 
				</c:when>
				<c:otherwise>
					<span class="label label-default">Not available</span>
				</c:otherwise>
				</c:choose>
				<p style = "margin-top: 15px;"><font style = "font-size: 18px;">Price: </font><font style="font-size: 16px; color:green; font-weight: bold;">$${lot.price}</font></p>
				<p><font style = "font-size: 18px;">Seller: </font>${lot.seller}</p>
				<p><font style = "font-size: 18px;">Condition: </font>${lot.condition}</p>
				<p><font style = "font-size: 18px;">Location: </font>${lot.location}</p>
				<p><font style = "font-size: 18px;">Decription: </font>${lot.description}</p>
			</div>
		</div>
	</div>
</div>		
		
	