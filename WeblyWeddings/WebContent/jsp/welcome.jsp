<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css"></link>
<link type="text/css" rel="stylesheet" href="css/custom1.css"></link>
<style type="text/css">
	#joinWeddingSection,#menu {
		margin: 2em;
	}
	#myWeddingSection {
		margin: 1em;
		height: 50%;
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
    	<section id="menu">
			<section class="row">
				<div class="col-lg-3 col-lg-offset-3">			
					<a id="join" class="btn btn-primary btn-lg" href="#joinWeddingSection">Join a Wedding</a>
				</div>
				<div class="col-lg-3 col-lg-offset-1">
					<a id="create" class="btn btn-primary btn-lg" href="#myWeddingSection">My Wedding</a>
				</div>
			</section>
			<section class="row">
				<div id="weddingInvites">
				
				</div>
			</section>
		</section>
		<div class="img-holder" data-image="img/scroll/3.jpg" data-height="900"></div>
		<section id="joinWeddingSection" class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<form role="form" id="joinWedding" method="get" action="JoinWeddingController">
					<div class="form-group">
						<label for="weddingName">Wedding Name</label>
						<input id="weddingName" class="form-control" name="weddingName" type="text" placeholder="Wedding Name" required>
					</div>
					<div class="row">
						<div class="col-lg-offset-5">
							<input id="joinBtn" type="submit" value="Join" class="btn btn-success btn-sm">
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</section>
		<div class="img-holder" data-image="img/scroll/2.jpg" data-height="900"></div>
		<section id="myWeddingSection">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<form role="form" id="myWeddingForm" method="post" action="MyWeddingController">
						<div id="weddingDetails">
							<div class="form-group">
								<label>Wedding Name</label>
								<input id="weddingName" class="form-control" name="weddingName" type="text" placeholder="Wedding Name" required>
							</div>
							<div class="form-group">
								<label>Bride's Email</label>
								<input id="brideEmail" class="form-control" name="brideEmail" type="text" placeholder="Bride's Email" required>
							</div>
							<div class="form-group">
								<label>Bridegroom's Email</label>
								<input id="bridegroomEmail" class="form-control" name="bridegroomEmail" type="text" placeholder="BrideGroom's Email" required>
							</div>
							<div class="form-group">
								<label>Date (yyyy-mm-dd)</label>
								<input id="date" class="form-control" name="date" type="text" placeholder="Wedding Date" required>
							</div>
							<div class="form-group">
								<label>Time (hh:mm)</label>
								<input id="time" class="form-control" name="time" type="text" placeholder="Wedding Time" required>
							</div>
							<div class="form-group">
								<label>Venue</label>
								<input id="venue" class="form-control" name="venue" type="text" placeholder="Venue" required>
							</div>
						</div>
						<div class="row">
							<div id="event1" class="col-lg-4">
								<h5>Event 1</h5>
								<div class="form-group">
									<label>Event Name</label>
									<input class="form-control" id="e1Name" name="e1Name" type="text" placeholder="Event Name" required>
								</div>
								<div class="form-group">									
									<label>Event Date (yyyy-mm-dd)</label>
									<input class="form-control" id="e1Date" name="e1Date" type="text" placeholder="Event Date" required>
								</div>
								<div class="form-group">
									<label>Event Time (hh:mm)</label>
									<input class="form-control" id="e1Time" name="e1Time" type="text" placeholder="Event Time" required>
								</div>
								<div class="form-group">
									<label>Venue</label>
									<input class="form-control" id="e1Venue" name="e1Venue" type="text" placeholder="Event Venue" required>
								</div>
							</div>
							<div id="event2" class="col-lg-4">
								<h5>Event 2</h5>
								<div class="form-group">
									<label>Event Name</label>
									<input class="form-control" id="e2Name" name="e2Name" type="text" placeholder="Event Name" required>
								</div>
								<div class="form-group">
									<label>Event Date (yyyy-mm-dd)</label>
									<input class="form-control" id="e2Date" name="e2Date" type="text" placeholder="Event Date" required>
								</div>
								<div class="form-group">
									<label>Event Time (hh:mm)</label>
									<input class="form-control" id="e2Time" name="e2Time" type="text" placeholder="Event Time" required>
								</div>
								<div class="form-group">
									<label>Venue</label>
									<input class="form-control" id="e2Venue" name="e2Venue" type="text" placeholder="Event Venue" required>
								</div>
							</div>
							<div id="event3" class="col-lg-4">
							<h5>Event 3</h5>
								<div class="form-group">
									<label>Event Name</label>
									<input class="form-control" id="e3Name" name="e3Name" type="text" placeholder="Event Name" required>
								</div>
								<div class="form-group">
									<label>Event Date (yyyy-mm-dd)</label>
									<input class="form-control" id="e3Date" name="e3Date" type="text" placeholder="Event Date" required>
								</div>
								<div class="form-group">
									<label>Event Time (hh:mm)</label>
									<input class="form-control" id="e3Time" name="e3Time" type="text" placeholder="Event Time" required>
								</div>
								<div class="form-group">
									<label>Venue</label>
									<input class="form-control" id="e3Venue" name="e3Venue" type="text" placeholder="Event Venue" required>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-5"></div>
									<div class="col-lg-2">
										<input id="newWeddingBtn" type="submit" value="Create" class="btn btn-primary">
									</div>
								<div class="col-lg-5"></div>
							</div>
						</div>
					</form>
					<div class="col-lg-2"></div>
				</div>
			</div>
		</section>
		<div class="img-holder" data-image="img/scroll/1.jpg" data-height="900"></div>
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
			$('#join').click(function(e){
				$.scrollTo($("#joinWeddingSection").position().top-200, 1500);
				e.preventDefault();
			});	
			$('#create').click(function(e){
				$.scrollTo($("#myWeddingSection").position().top, 1500);
				e.preventDefault();
			});
			$('.img-holder').imageScroll({imageAttribute:'image'});
		});
	</script>
</body>
</html>