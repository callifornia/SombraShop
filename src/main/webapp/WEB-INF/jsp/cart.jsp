<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class = "container">
	<div class = "row content_padding">
	<h1 class = "page_title_text" ><span class = "glyphicon glyphicon-shopping-cart checkout_button"></span> Shoping cart</h1>
	<c:if test="${empty product }">
		<p>You don't have any item yet</p>
	</c:if>
	<c:if test="${not empty product }">
	<a id = "checkout" class="btn btn-success btn-default  buy_btn" href = "${pageContext.request.contextPath}/checkout">Checkout</a>
	<table class="table table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Price</th>
          <th>Seller</th>
          <th>Location</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach  items="${product}" var = "product">
			<tr id = "lot_${product.id}">
				<td><img class="img-rounded img_cart" src="${pageContext.request.contextPath}/resources/img/product/${product.img}.png" alt="..."></td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.seller}</td>
				<td>${product.location}</td>
				<td><a href = "#" onclick="rem(${product.id})"><span class = "glyphicon glyphicon-remove"></span></a></td>		
			</tr>
		</c:forEach>
      </tbody>
	</c:if>
    </table>
	</div>
</div>