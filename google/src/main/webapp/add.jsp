<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.List, com.google.entity.MarkersCategory, com.google.dao.impl.MarkersCategoryDaoImpl" %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <title>reales | real estate web application</title>

        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/simple-line-icons.css" rel="stylesheet">
        <link href="css/jquery-ui.css" rel="stylesheet">
        <link href="css/datepicker.css" rel="stylesheet">
        <link href="css/fileinput.min.css" rel="stylesheet">
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
                <a href="index.jsp">
                    <span class="fa fa-home marker"></span>
                    <span class="logoText">reales</span>
                </a>
            </div>
            <a href="#" class="navHandler"><span class="fa fa-bars"></span></a>
            <div class="search">
                <span class="searchIcon icon-magnifier"></span>
                <input type="text" placeholder="Search for places...">
            </div>
            <div class="headerUserWraper">
                <a href="#" class="userHandler dropdown-toggle" data-toggle="dropdown"><span class="icon-user"></span></a>
                <a href="#" class="headerUser dropdown-toggle" data-toggle="dropdown">
                    <img class="avatar headerAvatar pull-left" src="images/avatar-1.png" alt="avatar">
                    <div class="userTop pull-left">
                        <span class="headerUserName">Admin</span> <span class="fa fa-angle-down"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
                <div class="dropdown-menu pull-right userMenu" role="menu">
                    <div class="mobAvatar">
                        <img class="avatar mobAvatarImg" src="images/avatar-1.png" alt="avatar">
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
                    <span class="searchIcon icon-magnifier"></span>
                    <input type="text" placeholder="Search for houses, apartments...">
                    <div class="clearfix"></div>
                </div>
                <ul>
                    <li><a href="explore.jsp"><span class="navIcon icon-compass"></span><span class="navLabel">Explore</span></a></li>
                    <li><a href="single.jsp"><span class="navIcon icon-home"></span><span class="navLabel">Single</span></a></li>
                    <li><a href="add.jsp"><span class="navIcon icon-plus"></span><span class="navLabel">New</span></a></li>
                    
                
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-link"></span><span class="navLabel">Pages</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="signin.jsp">Sign In</a></li>
                            <li><a href="index.jsp">Homepage</a></li>
							<li><a href="explore.jsp">Explore</a></li>
							<li><a href="add.jsp">Add</a></li>
							<li><a href="single.jsp">Single</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>

        </div>
        <div class="closeLeftSide"></div>

        <!-- Content -->

        <div id="wrapper">
            <div id="mapView" class="mob-min"><div class="mapPlaceholder"><span class="fa fa-spin fa-spinner"></span> Loading map...</div></div>
            <div id="content" class="mob-max">
                <div class="rightContainer">
				
				
                    <h1>List a New Category</h1>
                    <form role="form" action="AddServlet" method="post">
                     <input type="hidden" name="requestType" value="addCategory"/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <div class="form-group">
                                    <label>Title</label>
                                    <input type="text" class="form-control" name="title">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>Visibility</label><div class="checkbox custom-checkbox"><label>	<input type="checkbox" name="visibility"><span class="fa fa-check"></span>Public</label></div>	
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" rows="4" name="description"></textarea>
                        </div>
						
						 <div class="form-group">
							<input type="submit" class="btn btn-green btn-lg" value="Add Category">
                        </div>
                    </form>
					
					<BR><BR>
					<h1>List a New Marker</h1>
					

							
                    <form role="form" action="AddServlet" method="post">
                    <input type="hidden" name="requestType" value="addMarker"/>

					<div class="row">
					
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <div class="form-group">
                                    <label>Title</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>
							
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="btn-group">
                                    <label>Category</label>
                        <select class="form-control"  style="padding:8px 14px;">
  							<option selected disabled>Select...</option>
                                    <%
                                    MarkersCategoryDaoImpl categoryDao = new MarkersCategoryDaoImpl();
                    				List<MarkersCategory> categories = null;
                    				categories = categoryDao.getAll();
                                    
                    				for(MarkersCategory cat : categories) {
                                    %>
                                        <option value="<%= cat.getId()%>"><%= cat.getName()%></option>                                   
                                        
                                       <%} %>
						</select>
                                </div>
                            </div>
                            

                        </div>

                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" rows="4"></textarea>
                        </div>
						
                        
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label>Latitude</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label>Longitude</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label>Web Site</label>
                                    <div class="input-group">
                                        <input class="form-control" type="text">
                                    </div>
                                </div>
                            </div>
                 <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
				        <div class="input-group">
                            <label>Route</label>
                            <textarea class="form-control" rows="1"></textarea>
                        </div>
                        </div>
						</div>
                           
                                <div class="form-group">
                                    <label>Image Url</label>
                                    <input type="text" class="form-control">
                                </div>
								 <div class="form-group">
                                    <label>Icon Url</label>
                                    <input type="text" class="form-control">
                                </div>
                            

                        <div class="form-group">
							<input type="submit" class="btn btn-green btn-lg" value=" Add Marker ">
                        </div>
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <script src="js/json2.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/underscore.js"></script>
        <script src="js/moment-2.5.1.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery-ui-touch-punch.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.touchSwipe.min.js"></script>
        <script src="js/jquery.slimscroll.min.js"></script>
        <script src="js/jquery.visible.js"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places" type="text/javascript"></script>
        <script src="js/infobox.js"></script>
        <script src="js/clndr.js"></script>
        <script src="js/jquery.tagsinput.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/fileinput.min.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>