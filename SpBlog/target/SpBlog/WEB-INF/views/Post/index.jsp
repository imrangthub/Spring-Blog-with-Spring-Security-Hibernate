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
<h2>Current Category</h2>
 <table class="table">
    <thead>
      <tr>
        <th>Post Title</th>
        <th>Created Date</th>
        <th>Created by</th>
        <th>Last update</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>	
     <c:forEach items="${categoryList}" var="category">				
      <tr class="info">
        <td><c:out value="${category.title}"/></td>
        <td><c:out value="${category.createdDate}"/></td>
        <td><c:out value="${category.createdBy}"/></td>
        <td><c:out value="${category.lastUpdated}"/></td>
        <td>
        <a href="/SpBlog/category/edit/${ category.id}">Edit</a> | 
        <a href="/SpBlog/category/delete/${ category.id}">Delete</a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
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