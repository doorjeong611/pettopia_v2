<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js h-100" lang="kr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Template</title>
    <meta name="description" content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" id="main-stylesheet" data-version="1.1.0" href="${pageContext.request.contextPath}/styles/shards-dashboards.1.1.0.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/extras.1.1.0.min.css">
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	
</head>

<body class="h-100">

	<div class="color-switcher animated">
    	<h5>Accent Color</h5>
        	<ul class="accent-colors">
        		<li class="accent-primary" data-color="primary">
          			<i class="material-icons">check</i>
        		</li>
        		<li class="accent-secondary" data-color="secondary">
          			<i class="material-icons">check</i>
        		</li>
        		<li class="accent-success" data-color="success">
          			<i class="material-icons">check</i>
        		</li>
        		<li class="accent-info" data-color="info">
          			<i class="material-icons">check</i>
        		</li>
        		<li class="accent-warning" data-color="warning">
          			<i class="material-icons">check</i>
        		</li>
        		<li class="accent-danger" data-color="danger">
          			<i class="material-icons">check</i>
        		</li>
      	</ul>
      	<div class="close">
        	<i class="material-icons">close</i>
      	</div>
    </div>
    <div class="color-switcher-toggle animated pulse infinite">
    	<i class="material-icons">settings</i>
    </div>
    
    <div class="container-fluid">
    	<div class="row">
	        <!-- Sidebar -->
	        <aside class="main-sidebar col-12 col-md-3 col-lg-2 px-0">
	        	<c:import url="/WEB-INF/view/inc/sidebar.jsp"></c:import>  
	        </aside>
	        <!-- End Sidebar -->
        
	        <main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
	        	<!-- Main Navbar -->
	        	<div class="main-navbar sticky-top bg-white">
		            <c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	          	</div>
	          	<!-- End Main Navbar -->
	          
	            <div class="main-content-container container-fluid px-4">
	                <!-- Main Content -->
	            
	            
	            </div>
	          
	            <!-- Footer -->
	            <footer class="main-footer d-flex p-2 px-3 bg-white border-top"">
	                <c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>   
	            </footer>
	            <!-- End Footer -->
	        </main>
        </div>
    </div>
    
    	<!-- script -->
	    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	    <script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
	    <script src="scripts/extras.1.1.0.min.js"></script>
	    <script src="scripts/shards-dashboards.1.1.0.min.js"></script>
	    <script src="scripts/app/app-blog-overview.1.1.0.js"></script>
	    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>  -->
	</body>
</html>