<!DOCTYPE html>
<html lang="en">
<%@ page
	import="java.util.List, com.google.entity.MarkersCategory, com.google.dao.impl.MarkersCategoryDaoImpl"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>reales | real estate web application</title>

<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/simple-line-icons.css" rel="stylesheet">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/datepicker.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/app.css" rel="stylesheet">

<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body class="notransition">

	<!-- Header -->

	<div id="header">
		<div class="logo">
			<a href="index.jsp"> <span class="fa fa-home marker"></span> <span
				class="logoText">reales</span>
			</a>
		</div>
		<a href="#" class="navHandler"><span class="fa fa-bars"></span></a>
		<div class="search">
			<span class="searchIcon icon-magnifier"></span> <input type="text"
				placeholder="Search for places...">
		</div>
		<div class="headerUserWraper">
			<a href="#" class="userHandler dropdown-toggle"
				data-toggle="dropdown"><span class="icon-user"></span><span
				class="counter">5</span></a> <a href="#"
				class="headerUser dropdown-toggle" data-toggle="dropdown"> <img
				class="avatar headerAvatar pull-left" src="images/avatar-1.png"
				alt="avatar">
				<div class="userTop pull-left">
					<span class="headerUserName">Admin</span> <span
						class="fa fa-angle-down"></span>
				</div>
				<div class="clearfix"></div>
			</a>
			<div class="dropdown-menu pull-right userMenu" role="menu">
				<div class="mobAvatar">
					<img class="avatar mobAvatarImg" src="images/avatar-1.png"
						alt="avatar">
					<div class="mobAvatarName">Admin</div>
				</div>
				<ul>
					<li><a href="#"><span class="icon-settings"></span>Settings</a></li>
					<li class="divider"></li>
					<li><a href="#"><span class="icon-power"></span>Logout</a></li>
				</ul>
			</div>
		</div>


		<a href="#" class="mapHandler"><span class="icon-map"></span></a>
		<div class="clearfix"></div>
	</div>

	<!-- Left Side Navigation -->

	<div id="leftSide">
		<nav class="leftNav scrollable">
			<div class="search">
				<span class="searchIcon icon-magnifier"></span> <input type="text"
					placeholder="Search for houses, apartments...">
				<div class="clearfix"></div>
			</div>
			<ul>
				<li><a href="explore.jsp"><span
						class="navIcon icon-compass"></span><span class="navLabel">Explore</span></a></li>
				<li><a href="single.jsp"><span class="navIcon icon-home"></span><span
						class="navLabel">Single</span></a></li>
				<li><a href="add.jsp"><span class="navIcon icon-plus"></span><span
						class="navLabel">New</span></a></li>
				<li class="hasSub"><a href="#"><span
						class="navIcon icon-link"></span><span class="navLabel">Pages</span><span
						class="fa fa-angle-left arrowRight"></span></a>
					<ul>
						<li><a href="signin.jsp">Sign In</a></li>
						<li><a href="index.jsp">Homepage</a></li>
						<li><a href="explore.jsp">Explore</a></li>
						<li><a href="add.jsp">Add</a></li>
						<li><a href="single.jsp">Single</a></li>
					</ul></li>
			</ul>
		</nav>

	</div>
	<div class="closeLeftSide"></div>

	<!-- Content -->

	<div id="wrapper">
		<div id="mapView">
			<div class="mapPlaceholder">
				<span class="fa fa-spin fa-spinner"></span> Loading map...
			</div>
		</div>
		<div id="content">
			<div class="filter">
				<h1 class="osLight">Filter your results</h1>
				<a href="#" class="handleFilter"><span class="icon-equalizer"></span></a>
				<div class="clearfix"></div>
				<form class="filterForm">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 formItem">
							<div class="formField" id="mySelect">
								<label>Property Type</label> <a href="#" data-toggle="dropdown"
									class="btn btn-gray dropdown-btn dropdown-toggle propTypeSelect">
									<span class="dropdown-label">All</span> <span
									class="fa fa-angle-down dsArrow"></span>
								</a>
								<ul class="dropdown-menu dropdown-select full" role="menu">
									<li class="active"><input type="radio" name="pType"
										checked="checked"><a href="#"
										onclick="changeMap('-1');">All</a></li>
									<%
										List<MarkersCategory> categories = (List<MarkersCategory>) session
												.getAttribute("categories");
										if (categories != null) {
											session.removeAttribute("categories");
											//categories = categoryDao.getAll();

											for (MarkersCategory cat : categories) {
									%>
									<li><input type="radio" name="ptype"
										value="<%=cat.getId()%>"><a href="#"
										onclick="changeMap('<%=cat.getId()%>');"><%=cat.getName()%></a></li>

									<%
										}
										}
									%>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="resultsList">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/1-1.png" alt="image">
								<div class="figCaption">
									<div>$1,550,000</div>
									<span class="icon-eye"> 200</span> <span class="icon-heart">
										54</span> <span class="icon-bubble"> 13</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">FOR SALE</div>
							</div>
							<h2>Modern Residence in New York</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 39 Remsen St, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (146)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 3</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 3430 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/2-1.png" alt="image">
								<div class="figCaption">
									<div>$1,750,000</div>
									<span class="icon-eye"> 175</span> <span class="icon-heart">
										67</span> <span class="icon-bubble"> 9</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Rent</div>
							</div>
							<h2>Hauntingly Beautiful Estate</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 169 Warren St, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> (123)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 2</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 4430 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/3-1.png" alt="image">
								<div class="figCaption">
									<div>$1,340,000</div>
									<span class="icon-eye"> 180</span> <span class="icon-heart">
										87</span> <span class="icon-bubble"> 12</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Rent</div>
							</div>
							<h2>Sophisticated Residence</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 38-62 Water St, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> (120)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 2</li>
								<li><span class="icon-drop"></span> 3</li>
								<li><span class="icon-frame"></span> 2640 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/4-1.png" alt="image">
								<div class="figCaption">
									<div>$1,930,000</div>
									<span class="icon-eye"> 145</span> <span class="icon-heart">
										99</span> <span class="icon-bubble"> 25</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Sale</div>
							</div>
							<h2>House With a Lovely Glass-Roofed Pergola</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> Wunsch Bldg, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (170)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 3</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 2800 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/5-1.png" alt="image">
								<div class="figCaption">
									<div>$2,350,000</div>
									<span class="icon-eye"> 184</span> <span class="icon-heart">
										120</span> <span class="icon-bubble"> 18</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Rent</div>
							</div>
							<h2>Luxury Mansion</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 95 Butler St, Brooklyn, NY
								11231, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (257)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 2</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 2750 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/1-1.png" alt="image">
								<div class="figCaption">
									<div>$1,550,000</div>
									<span class="icon-eye"> 200</span> <span class="icon-heart">
										54</span> <span class="icon-bubble"> 13</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">FOR SALE</div>
							</div>
							<h2>Modern Residence in New York</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 39 Remsen St, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> (146)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 3</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 3430 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/2-1.png" alt="image">
								<div class="figCaption">
									<div>$1,750,000</div>
									<span class="icon-eye"> 175</span> <span class="icon-heart">
										67</span> <span class="icon-bubble"> 9</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Rent</div>
							</div>
							<h2>Hauntingly Beautiful Estate</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 169 Warren St, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (123)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 2</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 4430 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/3-1.png" alt="image">
								<div class="figCaption">
									<div>$1,340,000</div>
									<span class="icon-eye"> 180</span> <span class="icon-heart">
										87</span> <span class="icon-bubble"> 12</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Rent</div>
							</div>
							<h2>Sophisticated Residence</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 38-62 Water St, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (120)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 2</li>
								<li><span class="icon-drop"></span> 3</li>
								<li><span class="icon-frame"></span> 2640 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/4-1.png" alt="image">
								<div class="figCaption">
									<div>$1,930,000</div>
									<span class="icon-eye"> 145</span> <span class="icon-heart">
										99</span> <span class="icon-bubble"> 25</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Sale</div>
							</div>
							<h2>House With a Lovely Glass-Roofed Pergola</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> Wunsch Bldg, Brooklyn, NY
								11201, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (170)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 3</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 2800 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<a href="single.jsp" class="card">
							<div class="figure">
								<img src="images/prop/5-1.png" alt="image">
								<div class="figCaption">
									<div>$2,350,000</div>
									<span class="icon-eye"> 184</span> <span class="icon-heart">
										120</span> <span class="icon-bubble"> 18</span>
								</div>
								<div class="figView">
									<span class="icon-eye"></span>
								</div>
								<div class="figType">For Rent</div>
							</div>
							<h2>Luxury Mansion</h2>
							<div class="cardAddress">
								<span class="icon-pointer"></span> 95 Butler St, Brooklyn, NY
								11231, USA
							</div>
							<div class="cardRating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star-o"></span> (257)
							</div>
							<ul class="cardFeat">
								<li><span class="fa fa-moon-o"></span> 2</li>
								<li><span class="icon-drop"></span> 2</li>
								<li><span class="icon-frame"></span> 2750 Sq Ft</li>
							</ul>
							<div class="clearfix"></div>
						</a>
					</div>
				</div>
				<ul class="pagination">
					<li class="disabled"><a href="#"><span
							class="fa fa-angle-left"></span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#"><span class="fa fa-angle-right"></span></a></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery-ui-touch-punch.js"></script>
	<script src="js/jquery.placeholder.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.touchSwipe.min.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places"
		type="text/javascript"></script>
	<script src="js/infobox.js"></script>
	<script src="js/jquery.tagsinput.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/explore.js" type="text/javascript"></script>
</body>
</html>