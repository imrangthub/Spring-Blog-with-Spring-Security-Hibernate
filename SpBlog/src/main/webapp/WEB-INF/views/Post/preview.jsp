   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/partials/_head.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/partials/_navbar.jsp"/>
<div class="navbarSpace"></div>
<jsp:include page="/WEB-INF/views/partials/_leftSidBar.jsp"/>
<div class="container">

<div class="main_container"> 

 <div class="container"> <!-- Start container -->
  <header class="header_area">
   <div class="row">
    <div class="col-md-12">
     <div class="">
      <span class="lable">Manage Post</span>
      <span class="pull-right">
      <c:if test="${!empty successMsg}">
      <div style="color:green"> ${successMsg}</div> 
      </c:if>
        <c:if test="${!empty errorMsg}">
        <div style="color:red"> ${errorMsg}</div>
      </c:if>
      </span>
     </div>
    </div>
   </div>
  </header> 
  <!-- Start Left Side bar -->
   <nav class="navigation">
            <div class="row">
                <div class="col-xs-12 col-md-11 col-md-offset-1">
                    <nav class="navbar navbar-default2">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                   <li><a href="/SpBlog/post/">Post</a></li>
                                    <li><a href="/SpBlog/post/create">Create new Post</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div>
            </div>
        </nav>
 <!-- End Left Side bar -->
 <!-- body contain section -->
  <section class="content_area"> 
 <div class="row well"> <!-- Start Blog body post row -->
   <div class="col-md-8 col-md-offset-2">
    <h4>Post Preview</h4>
     <c:if test="${!empty  previewPost}">
       
       <div class="row">
       <div class="col-md-10">
       	   	<c:choose>
				 <c:when test="${empty previewPost.featureImg }"><h4>No Image</h4></c:when>
				 <c:otherwise>
		         <img src="/SpBlog/resources/imgFolder/${previewPost.featureImg}" width="600px" height="400px"/>
				 </c:otherwise>
			</c:choose>
       </div>
       <div class="col-md-2">
        <h4>Category Id</h4>
        ${previewPost.categoryId }
       </div>
       </div>

      <div class="row">
       <div class="col-md-12">
       
       <div class="row">
       <div class="col-md-12">
       <h4>${ previewPost.title}</h4> 
       <p>${previewPost.body }</p>
       </div>
       </div>
       
       </div>
      </div>
     

     </c:if> 
</div> <!-- End Blog body row -->
</div>  
           
  </section>
       <!-- End body contain section -->
       
        <footer class="footer_area">
            <div class="row">
                <div class="col-xs-12">
                    <div class="copyright">
                        <p>&copy; Copyright Md Imran hossain.</p>
                    </div>
                </div>
            </div>
        </footer>
 
 </div>     <!-- End container -->
</div>
  
</div> <!-- /container --> 
</body>
</html>