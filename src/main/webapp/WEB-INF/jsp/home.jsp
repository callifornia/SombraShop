<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<div class = "container">
	<div class="row">
		<c:forEach var="product" items="${product}">
			<div class="col-sm-6 col-md-3">
		      <div class="thumbnail">
				<a href="${pageContext.request.contextPath}/lot/${product.id}">
			      	<c:if test="${empty product.img }">
				        <img id = "general-page-product-img" class="img-rounded" src="${pageContext.request.contextPath}/resources/img/product/empty_product.png" alt="...">
			      	</c:if>
			      	<c:if test="${not empty product.img }">
				        <img class="img-rounded" src="${pageContext.request.contextPath}/resources/img/product/${product.img}.png" alt="...">
			      	</c:if>
		   		</a>
		        <div class="caption">
		          <a href = "${pageContext.request.contextPath}/lot/${product.id}"><h3>${product.name}</h3></a>
		          <p>price: $${product.price}</p>
		          <p>location: ${product.location}</p>
		        </div>
	   		</div>
		</div>
	   	</c:forEach>
	</div> <!-- /.row -->

	<div class = "row" align="center">
	<nav>
		<ul class="pagination">
			<c:if test="${not empty pagi.previousPage }">
				<li><a href="${pageContext.request.contextPath}/${pagi.previousPage}">Previous</a></li>
			</c:if>
			<c:forEach items="${pagi.pageList}" var="page">
				<c:choose>
					<c:when test="${pagi.currentPage == page}">
						<li class="active"><a href="#">${page}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/${page}">${page} </a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${not empty pagi.nextPage}">
				<li><a href="${pageContext.request.contextPath}/${pagi.nextPage}">Next</a></li>
			</c:if>
		</ul>
	</nav>
	</div>
</div> <!-- /.container -->