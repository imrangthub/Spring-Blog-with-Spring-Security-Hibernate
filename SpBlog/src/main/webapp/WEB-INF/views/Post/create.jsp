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
 <div class="col-md-12">
   <div class="col-md-8 col-md-offset-2">
    <form action="/SpBlog/post/create" method="POST" enctype="multipart/form-data" class="form-horizontal" id="postForms">
     <input type="hidden" name="id" value="${post.id }" />
      
     <div class="form-group">  
     <label class="control-label">Category:</label>
     <select class="form-control" name="category_id" id="category_id">
     <c:if test="${!empty categoryList}">
           <c:forEach items="${categoryList}" var="category">
            <option value="${category.id }">${category.title}</option>
           </c:forEach>
     </c:if>
         <option value="0">None</option>
     </select>
    </div>
    <div class="form-group">  
     <label class="control-label">Title:</label>
     <input type="text" id="title" name="title" class="form-control" value="${post.title }"> 
     <span class="msg" id="title"></span>       
    </div>
    
       
  <div class="form-group">  
     <label class="control-label">Body:</label>
     <textarea id="body" name="body"  rows="10" class="form-control"> <c:if test="${empty post.title}">Type your message here.....</c:if>${post.body } </textarea> 
     <span class="msg" id="body"></span>
    </div>
    
    <c:if test="${!empty post.featureImg }">
     <div class="form-group">  
     <label class="control-label">Current Image:</label>
     <div style="width:100px; height:80px">
	    <img src="/SpBlog/resources/imgFolder/${post.featureImg}" width="100px" height="80px"/>
	 </div>       
    </div>
    </c:if>   
    
    <div class="form-group">  
    <label class="control-label">Feature Image:</label>
    <input type="file" id="file" name="file" class=" ">
    </div>
    
    <div class="form-group">
    <input type="submit" value="Save now" class="btn btn-success btn-lg btn-block">
    </div>
   </form>
    

 </div>  
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