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
                                    <li><a href="/SpBlog/post/create">Create new post</a></li>
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
   <div class="col-md-12">
     <h2>Current Post</h2>
      <c:if test="${!empty postList}">
         <c:forEach items="${postList}" var="post">
           <div class="row">
		     <div class="col-md-12">   	  
		   	 <div class="col-md-8">
			  <div class="post">
			   <strong>${post.postTitle }</strong>
			   <p>${post.postBody }</p> 
			  </div>
			  </div>
			  <div class="col-md-2">
			   <div class="post">
			   <strong>Post Image</strong>
			   <hr>
			   <div style="width:100px; height:80px">
			   	<c:choose>
				 <c:when test="${empty post.postImg }"><h4>No Image</h4></c:when>
				 <c:otherwise>
			      <img src="/SpBlog/resources/imgFolder/${post.postImg}" width="100px" height="80px"/>
				 </c:otherwise>
				</c:choose>
			  </div>  
			  </div>
		      </div>
		      <div class="col-md-2">
			   <span>Category</span>
			   <div>${post.categoryTitle }</div>
			   <hr>
			   </div>
		    <div class="col-md-12" style="">
		    <a href="/SpBlog/post/perview/${post.id}" class="btn btn-success">PREVIEW POST</a>
		    <a href="/SpBlog/post/edit/${post.id}" class="btn btn-primary">EDIT POST</a>
		    <a href="/SpBlog/post/delete/${post.id}" class="btn btn-danger">DELETE POST</a>
           </div>
		   </div>
		  </div>
         </c:forEach>
      </c:if>
   </div>
 </div> <!-- End Blog body row -->       
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

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
   <form id="create-form" class="form-horizontal">
   <input type="hidden" name="id" id="id" />
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Create Product</h4>
      </div>
      <div class="modal-body">
        <div>
	      <div class="col-sm-10">
	      <div class="form-group">
	        <label class="control-label col-sm-4">Name</label>
	        <div class="col-sm-8">
	          <input type="text" id="title" class="form-control" name="title" value="" />
	        </div>
	      </div>
	    </div>
	       <div class="form-group"> 
	        <div class="col-sm-offset-2 col-sm-8">
	        </div>
	      </div>
      </div>               
      </div>
      <div class="modal-footer">
        <button type="button" id="submitBtn" class="btn btn-success" data-dismiss="modal">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </form>
  </div>
</div>
<!-- End model -->
<script>
$(document).ready(function(){

	 $("#submitBtn").click(function(e){ 
		 $.ajax({
			 url:'create',
			 type:'POST',
			 data:$("#create-form").serialize(),
			 success: function(data){
				 alert(data.successMsg);
			 }
			 
		 });
		 e.preventDefault();
	 });
});
</script>    
</body>
</html>