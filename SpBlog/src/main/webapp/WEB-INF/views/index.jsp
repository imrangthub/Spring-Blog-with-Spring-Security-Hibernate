
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/partials/_head.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/partials/_navbar.jsp" />

	<div class="container">
		<!-- Main component for a primary marketing message or call to action -->
		<div class="row well">
			<div class="col-md-12">
				<div class="jumbotron">
					<h1>Welcome to My Blog</h1>
					<p>This is a Spring MVC Blog with Spring security</p>
				</div>

				<c:choose>
					<c:when test="${empty postList}">
						<p class="bg-info">NO POST</p>
						<br />
					</c:when>
					<c:otherwise>
					    <div class="row">
					    	<div class="col-md-12">
								<div class="row">
									<div class="col-md-12">
									<c:choose>
									 <c:when test="${empty lastPost.postImg }"><h4>There is no Image for this post</h4></c:when>
									 <c:otherwise>
									 	<img src="/SpBlog/resources/imgFolder/${lastPost.postImg}"
											width="800px" height="400px" alt="feature Image"
											class="img-rounded">
									 </c:otherwise>
									</c:choose>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<h4>${lastPost.postTitle }</h4>
										<h6>Category: ${lastPost.categoryTitle }</h6>
										<p class="bg-info">${lastPost.postBody}</p>
									</div>
								</div>
							</div>
					    </div>
						<div class="row">
							<c:forEach items="${postList }" var="post">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-12">
									<c:choose>
									 <c:when test="${empty post.postImg }"><h4>There is no Image for this post</h4></c:when>
									 <c:otherwise>
									 	 <img src="/SpBlog/resources/imgFolder/${post.postImg}"
												width="450px" height="300px" alt="feature Image"
												class="img-rounded">
									 </c:otherwise>
									</c:choose>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<h4>${post.postTitle }</h4>
											<h6>Category: ${post.categoryTitle }</h6>
											<p class="bg-info">${post.postBody}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<br />
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<!-- /container -->
	<!-- <jsp:include page="/WEB-INF/views/partials/_footer.jsp" /> -->

</body>
</html>