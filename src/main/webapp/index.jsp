<%@page import="net.sf.uadetector.service.UADetectorServiceFactory"%>
<%@page import="net.sf.uadetector.*"%>
<%@page import="datacollector.DataCollector"%>
<%@page import="java.util.List"%>
<%@page import="dataprocessor.DataProccessor"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kids Portal</title>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

	<jsp:include page="nav.jsp" />
	<%
// 	String agent = request.getHeader("User-Agent");

    String ani=(String) session.getAttribute("user");
    System.out.println("Enter in Session "+ani);
      if(ani == null)
      {
    	  response.sendRedirect("landing.jsp");
    	  return;
    	  
    	  }
//       DataCollector.insertUserDevice(agent, ani);
    %>
      <script type="text/javascript">
    
		 function savesession(cat) {
				sessionStorage.setItem("cate", cat);
			}

			window.onload = function getsession() {

				let cate = sessionStorage.getItem("cate");
				console.log(cate)
				if(cate == null)
					{
				let tab=	document.getElementById("DIY")
				tab.classList.add('active');
				let con=	document.getElementById("DIY_tab")
// 				con.classList.add('active show');
				con.className +='active show';
					}
				else{
					
					let tab=	document.getElementById(cate)
					tab.classList.add('active');
					let con=	document.getElementById(cate+"_tab")
//	 				con.classList.add('active show');
					con.className +='active show';
					
					
				}

			}
			
		</script>
	<div class="container main">
		<div class="row">
			<div class="col-md-12">
				<div id="carouselExampleIndicators" class="carousel slide mt-3" id="mvid"
					data-ride="carousel" data-interval="5000">
					
					<!-- 				<ol class="carousel-indicators"> -->
					<!-- 				  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> -->
					<!-- 				  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li> -->
					<!-- 				  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
					<!-- 				</ol> -->
					<div class="carousel-inner" >
						<%
				try{
				String status="active";
			
			
				ResultSet rs= DataProccessor.getBanners();
				
				while(rs.next())
				{
					String imgurl=rs.getString("imgurl");
					String id=rs.getString("videoid");
					String vurl=rs.getString("vurl");
					%>
						<div class="carousel-item <%=status%>" >
<%-- 							<a href="video?id=<%=id%>">  --%>
							<img src="<%=imgurl %>"
								class="d-block w-100 img-fluid" alt="...">
<!-- 								</a> -->
						</div>
						
<%-- 						<div class="carousel-item <%=status%> " > --%>
<!-- 						<video autoplay class="d-block w-100 img-fluid" id="videos"> -->
<%-- 						  <source src="<%=vurl %>" type="video/mp4"> --%>
<!-- 						</video> -->
<!-- 						</div> -->
						<%
					
					status="";
				}
				
				
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				
				%>

					</div>
					<h3 class="cus-head mt-3">Discover Videos for Kids</h3>
				</div>

					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">



						<%
					 List<String> list = DataProccessor.getCategories();
					 try{
					
                      int count=0;
					for(String name:list) {
						
							if(count == 0)
						{
							%>
						<li class="nav-item" role="presentation"><a onclick="savesession('<%=name.substring(0, 3)%>')"
							class="nav-link " id="<%=name %>" data-toggle="pill"
							href="#<%=name.substring(0,3) %>_tab" role="tab"
							aria-controls="pills-<%=name.substring(0,3) %>"
							aria-selected="true"><%=name.substring(0,3) %></a></li>

						<%
					count++;
					
					continue;
					}
					%>

						<li class="nav-item" role="presentation"><a class="nav-link"
							id="<%=name.substring(0, 3)%>" data-toggle="pill"
							href="#<%=name.substring(0, 3)%>_tab" role="tab"
							aria-controls="pills-<%=name.substring(0, 3)%>"
							aria-selected="false"
							onclick="savesession('<%=name.substring(0, 3)%>')"><%=name%></a></li>
							 
						<%
					
					}
					 }catch(Exception e)
					 {
						 e.printStackTrace();
					 }
					%>

					</ul>
					<div class="tab-content" id="pills-tabContent">
						<%
					try {		
						            int co = 0;
									String status = "show active";
									status="";
									for (String names : list) {
					%>
						<div class="tab-pane fade <%=status%>"
							id="<%=names.substring(0, 3)%>_tab" role="tabpanel"
							aria-labelledby="<%=names.substring(0, 3)%>">
							<h4><%=names%></h4>
							<div class="row">

								<%
							ResultSet rs = DataProccessor.getContent(names);
								
								if(names.equalsIgnoreCase("games")){
							while(rs.next())
							{
								String gname=rs.getString("gamename");
								String gid=rs.getString("gameid");
								String imgurl=rs.getString("imgurl");
								%>
								<div class="col-md-6 col-12 my-2">
									<div class="video-box position-relative mb-0">
										<a href="play?id=<%=gid%>" > <img src="<%=imgurl%>" alt=""
											class="img-fluid"> <i class="fa fa-play-circle"
											aria-hidden="true"></i>
										</a>
										<p class="text-center text-deco"><%=gname%></p>
									</div>

								</div>

								<% 
									}
								}else
								{
									while(rs.next())
									{
										String vname=rs.getString("name");
										String vid=rs.getString("videoid");
										String imgurl=rs.getString("imgurl");
										%>
										<div class="col-md-6 col-12 my-2">
											<div class="video-box position-relative mb-0">
												<a href="video?id=<%=vid%>"> <img src="<%=imgurl%>" alt=""
													class="img-fluid"> <i class="fa fa-play-circle"
													aria-hidden="true"></i>
												</a>
												<p class="text-center text-deco"><%=vname%></p>
											</div>

										</div>

										<% 
											}
								}
								
									%>
							</div>
						</div>
						<%
					status = "";
					}

					} catch (Exception e) {
					e.printStackTrace();
					}
					%>

					</div>
			</div>
		</div>
		
		<jsp:include page="footer.jsp" />
		
</body>
</html>