<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wedding</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css"></link>
<link type="text/css" rel="stylesheet" href="css/custom1.css"></link>
<style type="text/css">
	#photos, #events{
		margin: 1em;
	}
	#buttons {
		margin-top: 1em;
		margin-bottom: 1em;
	}
	.plural-container {
		height: 50%;
		width: 50%;
	}
</style>
</head>
<body>
	<div id="container">
		<nav class="navbar navbar-inverse" role="navigation">
	    	<div class="navbar-header">
	      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
	        		<span class="sr-only">Toggle navigation</span>
	        		<span class="icon-bar"></span>
	        		<span class="icon-bar"></span>
	        		<span class="icon-bar"></span>
	      		</button>
	      		<a class="navbar-brand" href="jsp/index.jsp">Webly Weddings</a>
	    	</div>
	   		<div class="collapse navbar-collapse navbar-right" id="navbar-collapse-1">  
	     		<ul class="nav navbar-nav">
	         		<li id="userName"><a>${sessionScope.user.userName}</a></li>
	         		<li><a href="Logout">Logout</a></li>
	     		</ul>
	   		</div>
	    </nav>
	    <div class="img-holder" data-image="img/scroll/4.jpg" data-height="900"></div>
	    <section id="invitation">
	    		<div class="row">
	    			<div class="col-lg-offset-5">
						<h4>Wedding Name</h4>
						<p><c:out value="${sessionScope.wedding.weddingName}"/></p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-offset-5">
						<h4>Bride Groom</h4>
						<p><c:out value="${sessionScope.wedding.bride}"/></p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-offset-5">
						<h4>Bride</h4>
						<p><c:out value="${sessionScope.wedding.brideGroom}"/></p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-offset-5">
						<h4>Date and Time</h4>
						<p><c:out value="${sessionScope.wedding.dateTime}"/></p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-offset-5">
						<h4>Venue</h4>
						<p><c:out value="${sessionScope.wedding.venue}"/></p>
					</div>
				</div>
			</div>
			<div id="buttons" class="row">
				<div class="col-lg-3 col-lg-offset-3">
					<a id="gotoPhotos" href="#photos" class="btn btn-primary btn-lg">Photos</a>
				</div>
				<div class="col-lg-3 col-lg-offset-1">
					<a id="gotoEvents" href="#events" class="btn btn-success btn-lg">Events</a>
				</div>
			</div>
		</section>
		<div class="img-holder" data-image="img/scroll/3.jpg" data-height="900"></div>
		<section id="photos">
			<c:set var="photos" value="${sessionScope.wedding.photos}"/>
			<div class="row">
				<c:forEach items="${photos}" var="item">
					<div class="col-lg-4 plural-container">
						<img src="img/${item.photoId}"/>
						<input value="Like" type="button" id="${item.photoId}" class="likeBtn" class="btn btn-primary btn-xs" onclick="likePhoto('${item.photoId}')">
					</div>
				</c:forEach>
			</div>
		</section>
		<div class="img-holder" data-image="img/scroll/2.jpg" data-height="900"></div>
		<section id="events">
			<c:set var="events" value="${sessionScope.wedding.events}"/>
			<c:set var="i" value="${1}"/>
			<div class="row">
				<c:forEach items="${events}" var="item">
					<div class="col-lg-3">
						<h3>Event ${i}</h3>
						<h4>Event Name</h4>
						<p>${item.eventName}</p>
						<h4>Date and Time</h4>
						<p>${item.eventDateTime}</p>
						<h4>Venue</h4>
						<p>${item.venue}</p>
						<c:set var="i" value="${i+1}"/>
					</div>
				</c:forEach>
			</div>
		</section>
		<div class="img-holder" data-image="img/scroll/1.jpg" data-height="900"></div>
		<footer>
				&amp; 2014-2015
		</footer>
	</div>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.imageScroll.min.js"></script>
	<script type="text/javascript" src="js/jquery.scrollTo.js"></script>
	<script type="text/javascript" src="js/jquery.localScroll.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#gotoPhotos').click(function(e){
				$.scrollTo($("#photos").position().top-100, 1500);
				e.preventDefault();
			});	
			$('#gotoEvents').click(function(e){
				$.scrollTo($("#events").position().top, 1500);
				e.preventDefault();
			});
			$('.img-holder').imageScroll({imageAttribute:'image'});
		});
		function likePhoto(id) {
			$.ajax({
				type : 'GET',
				url : 'LikePhotoController',
				data : 'photoId=' + id,
				dataType : "text/html;charset=utf-8",
				success : function(data) {
					$('#' + id.replace('.','\\\\.')).attr('value',data);
					console.log(data + "hello");
				}
			});
		}
	</script>
</body>
</html>