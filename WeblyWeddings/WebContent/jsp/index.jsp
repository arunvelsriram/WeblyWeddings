<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Webly Weddings</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css"></link>
<link type="text/css" rel="stylesheet" href="css/custom1.css"></link>
<style type="text/css">
	#container {
		margin: 0 1em;
	}
	h1 {
		font-size: 3em;
	}
	.btn-large {
		font-size: 24px;
	}
	.login-buttons {
		margin: 1em;
	}
</style>
</head>
<body>
	<div id="container">
		<div class="img-holder" data-image="img/scroll/4.jpg" data-height="900"></div>
		<header class="row">
			<center><h1>Webly Weddings<small> tie the knot with us</small></h1></center>
			<center><a id="getStarted" class="btn btn-success btn-lg" href="#way">Get Started</a></center>
		</header>
		<div class="img-holder" data-image="img/scroll/3.jpg" data-size="900"></div>
		<section id="way" class="row">
			<section class="col-lg-offset-3">
				<h3>Your way to Webly Weddings is just a click away.</h3>
			</section>
		</section>
		<section class="row login-buttons">
			<section class="col-lg-3 col-lg-offset-3">
				<a id="signup" class="section-link" href="#loginSection"><button class="btn btn-success btn-lg" onclick="showForm('signup.html')">Sign Up</button></a>
			</section>
			<section class="col-lg-3 col-lg-offset-1">
				<a id="signin" class="section-link" href="#loginSection"><button class="btn btn-primary btn-lg" onclick="showForm('signin.html')">Sign In</button></a>
			</section>
		</section>
		<div class="img-holder" data-image="img/scroll/2.jpg" data-size="900"></div>
		<section id="loginSection">
				
		</section>
		<div class="img-holder" data-image="img/scroll/1.jpg" data-size="900"></div>	
		<footer>
				&copy; 2014-2015
		</footer>
	</div>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.imageScroll.min.js"></script>
	<script type="text/javascript" src="js/jquery.scrollTo.js"></script>
	<script type="text/javascript" src="js/jquery.localScroll.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.section-link').click(function(e){
				$.scrollTo($("#loginSection").position().top-100, 1500);
				e.preventDefault();
			});	
			$('#getStarted').click(function(e){
				$.scrollTo($("#way").position().top-100, 1500);
				e.preventDefault();
			});
			$('.img-holder').imageScroll({imageAttribute:'image'});
		});
		function showForm(filename) {
			$('#loginSection').load(filename)
		}
	</script>
</body>
</html>