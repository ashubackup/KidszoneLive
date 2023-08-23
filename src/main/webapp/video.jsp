<%@page import="net.sf.uadetector.service.*"%>
<%@page import="net.sf.uadetector.*"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="dataprocessor.DataProccessor"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String ani = (String) session.getAttribute("user");
System.out.println("Enter in Session " + ani);
if (ani == null) {
response.sendRedirect("landing.jsp");
	return;

}
String agent = request.getHeader("User-Agent");
UserAgentStringParser parser = UADetectorServiceFactory.getResourceModuleParser();

ReadableUserAgent ra = parser.parse(agent);
OperatingSystem os = ra.getOperatingSystem();
String device = os.getFamilyName().toUpperCase();
// System.out.println(device);
String id = request.getParameter("id");
String surl = "https://kidszone.gamesawaari.com/video?id=" + id;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kids videos</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/vj.css">
<link href="https://vjs.zencdn.net/7.11.4/video-js.css" rel="stylesheet" />
</head>
<body>


	<jsp:include page="nav.jsp" />


	<%
	String name = "";
	String url = "";
	String category = "";
	String postar = "";
	try {
		Map<String, String> map = DataProccessor.getVideo(id);
		name = map.get("name");
		url = URLDecoder.decode(map.get("vurl"));
		category = map.get("category");
		postar = map.get("imgurl");
		if (device.equalsIgnoreCase("ios") || device.equalsIgnoreCase("linux") || device.equalsIgnoreCase("OS X")) {
			if (category.equalsIgnoreCase("DIY")) {
		url = map.get("url");
			}

		}
	%>

	<div class="play-video">

		<!--      <video  id="videoplay" width="100%" controls autoplay  > -->
		<%--         <source src="<%=url%>" type="video/mp4"> --%>
		<%--         <source  src="<%=url %>" type="video/webm"> --%>
		<!--         </video> -->


		<video preload="auto" autoplay id="my-video"
			class="video-js vjs-big-play-centered" controls preload="auto"
			width="1340" height="600" data-setup="{}" poster="<%=postar%>">
			<source src="<%=url%>" type="video/mp4" />
			<source src="<%=url%>" type="video/mkv" />
			<p class="vjs-no-js">To view this video please enable JavaScript,
				and consider upgrading to a web browser that</p>

		</video>

<!-- 		<div class="title"> -->
<%-- 			<h4 class="pl-3 py-2"><%=name%></h4> --%>
<!-- 			<div class="sharebtnn py-2 px-2"> -->
<!-- 				<button type="button" class="btn btn-primary"> -->
<!-- 					<i class="far fa-thumbs-up"></i> Like -->
<!-- 				</button> -->
<!-- 				<div class="share-button sharer" style="display: block;"> -->
<!-- 					<button type="button" class="btn btn-primary share-btn"> -->
<!-- 						<i class="fas fa-share"></i> Share -->
<!-- 					</button> -->
<!-- 					<div class="social top center networks-5 "> -->
<!-- 						Facebook Share Button -->
<!-- 						<a class="fbtn share facebook" -->
<%-- 							onclick="addshare('<%=ani%>','facebook')" --%>
<%-- 							href="https://www.facebook.com/sharer/sharer.php?u=<%=surl%>&amp;src=sdkpreparse" --%>
<!-- 							target="_blank"><i class="fab fa-facebook-f"></i></a> -->

<!-- 						                       Twitter Share Button -->
<!-- 						<a class="fbtn share twitter" -->
<%-- 							onclick="addshare('<%=ani%>','twitter')" --%>
<%-- 							href="https://twitter.com/intent/tweet?text=&url=<%=surl%>" --%>
<!-- 							target="_blank"><i class="fab fa-twitter"></i></a> -->

<!-- 						                           whatsapp Share Button -->
<!-- 						<a class="fbtn share what" -->
<%-- 							onclick="addshare('<%=ani%>','whatsapp')" --%>
<%-- 							href="https://api.whatsapp.com/send?text=<%=surl%>" --%>
<!-- 							target="_blank" data-action="share/whatsapp/share"><i -->
<!-- 							class="fab fa-whatsapp"></i></a> -->

<!-- 						                        LinkedIn Share Button -->
<!-- 						                        <a class="fbtn share linkedin" href="#"><i class="fab fa-linkedin-in"></i></a> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<button type="button" class="btn btn-primary" -->
<!-- 					onclick="commentShow()"> -->
<!-- 					<i class="fas fa-comments"></i> Comment -->
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<div class="enter-comment" id="cmdiv" style="display: block;"> -->
<!-- 			<div class="coments"> -->
<!-- 				<div class="container sections" id="addcomments"> -->

<!-- 					
<!-- 					<div class="row pt-3 align-items-center"> -->
<!-- 						<div class="col-md-1 col-2"> -->
<!-- 							<img src="images/user1.jpg" alt="" class="img-fluid"> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 col-10"> -->
<!-- 							<h5 class="mb-0">Sahil Mehra</h5> -->
<!-- 							<p class="mb-0">Hello, Nice And Beautifull Video.</p> -->
<!-- 						</div> -->
<!-- 					</div> -->


<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<div class="comment-section"> -->
							
<!-- 								<div class="form-group pt-3"> -->
<!-- 									<input class="form-control" id="exampleFormControlTextarea1" -->
<!-- 										></input> -->
<%-- 									<button type="button" class="btn btn-primary mt-3" onclick="addComment('<%=id%>','<%=ani%>')">Add --%>
<!-- 										Comment</button> -->
<!-- 								</div> -->
							
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
					<!-- <div class="sharebtnn p-2">
			            <button type="button" class="btn btn-primary"><i class="far fa-thumbs-up"></i> Like</button>
			            <button type="button" class="btn btn-primary"><i class="fas fa-share"></i> Share</button>
				    <button type="button" class="btn btn-primary"><i class="fas fa-comments"></i> Comment</button>
			        </div> -->
	</div>


	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="like mt-3">
					<h3>You May Like</h3>
				</div>

				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="nursery" role="tabpanel"
						aria-labelledby="pills-home-tab">
						<div class="row">


							<%
							try {
								ResultSet rs = DataProccessor.getContent(category);
								while (rs.next()) {
									String vname = rs.getString("name");
									String vid = rs.getString("videoid");
									String imgurl = rs.getString("imgurl");
							%>
							<div class="col-md-6 col-6 my-2">
								<div class="video-box position-relative">
									<a href="video?id=<%=vid%>"> <img src="<%=imgurl%>" alt=""
										class="img-fluid"> <i class="fa fa-play-circle"
										aria-hidden="true"></i>
									</a>
									<p class="text-center text-deco"><%=vname%></p>
								</div>
							</div>
							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>

							<!--                             <div class="col-md-6 col-6"> -->
							<!--                                 <div class="video-box position-relative"> -->
							<!--                                     <img src="images/cartoon1.jpg" alt="" class="img-fluid"> -->
							<!--                                     <a href="video.html"> -->
							<!--                                         <p class="content">The Dove And The Ant</p> -->
							<!--                                         <i class="fa fa-play-circle" aria-hidden="true"></i> -->
							<!--                                     </a> -->
							<!--                                 </div> -->
							<!--                             </div> -->



						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp" />

	<script type="text/javascript">
 
   activityWatcher("<%=ani%>
		");

		$(document).ready(
				function() {
					//custom button for homepage
					$(".share-btn").click(
							function(e) {
								$('.networks-5').not(
										$(this).next(".networks-5")).each(
										function() {
											$(this).removeClass("active");
										});

								$(this).next(".networks-5").toggleClass(
										"active");
							});
				});
	</script>

</body>
</html>