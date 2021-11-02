<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Kulture</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <!-- 제가 적용하는 style 및 sript 부분 -->
        <script src="/jquery-3.2.1.min.js"></script>
<style>

</style>

<script>

$(window).on("scroll", function() {
	  var winTop = $(window).scrollTop();
	  if (winTop >= 100)  {
	    $("#toReveal").addClass("revealed");
	 }
});

</script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main2">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    	<li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                        <li class="nav-item"><a class="nav-link" href="#services">About</a></li>
                        <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>
                        <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li> 
                        <li class="nav-item"><a class="nav-link" href="/insertmember">Join</a></li>
                        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>
                        
              
                    </ul>
                </div>
            </div>
        </nav>
        
        
 <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100" >
                   <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                   <!--
                   <div class="col-lg-8 align-self-end">
                      
                        <h1 class="text-white font-weight-bold"></h1>
                        <h1 class="text-white font-weight-bold"></h1>
                         <hr class="divider" /> 
                    </div>-->
                   <!-- <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 mb-5"></p> </div>-->
<!-- ==================================================================================== -->
                        <!-- 타이틀 테스트 -->



<div id="contents" class="container" align="center">			
<div class="container" id="typo"></div>
	
<!-- ==================================================================================== -->                        
                           <!-- 이 달의 추천 -->
          <div id="monthly_typo">Monthly Recommendation</div><br>
<form action=/contents>
	<table>
		<center>
			<% for (int i=0; i < 4; i++) {%>
			<a class="btn btn-primary btn-xl1" href="./contents?content_title=<%=contentslist.get(i).getContent_title() %>"><%=contentslist.get(i).getContent_title()%></a>
			<% } %>			
		</center>
		<div id="space_little"></div>
		<!-- 이미지 영역 -->
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
				<a target="_blank" href="●">
				<img onclick="location.href='./contents?content_title=<%=contentslist.get(i).getContent_title() %>'"
				src=<%=contentslist.get(i).getContent_url()%> style="width:10em; height:15em;"></a>
				<% } %>
			</th>
		</tr>
	</table>
</form>
                        <div id="space_little"></div>
                        <a class="btn btn-primary btn-xl" id="studybtn" onclick="studybtn()">Let's Study</a>
                    </div>

                </div> <!-- <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center"> -->
            </div>
        </header>
        <!-- ==================================================================== -->
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
            <!-- <div class="container" id="toReveal"></div> -->
                <h2 class="text-center mt-0" id="title_typo">What is Kulture ? </h2>
                <hr class="divider" />
                <div id="toReveal">Kulture is a word combined with 'Korea' and 'Culture'.
                We recommend various contents popular in Korea. <br>
                We provides Shadowing Service so that you can develop your Koraen language skills using K-contents you are interested in.</div>
                <div id="space_little2"></div>
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-4 col-md-6 text-center">
                    
                        <div class="mt-5">
                        <div class="mb-2">
                        
                            
                        <i class="bi-gem fs-1 text-primary">
                             </i></div>
                             
                            <h3 class="h4 mb-2">Find slang used in Korea</h3>
                            <p class="text-muted mb-0">We service slang and famous dialogue translation used in drama, movie.
                            <br>You can get communication skills in Korean. </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="mt-5">
                        <div class="mb-2"><i class="bi-globe fs-1 text-primary">
                           </i></div>
                            <h3 class="h4 mb-2">Recommend Contents </h3>
                            <p class="text-muted mb-0">You can find various contents popular in Korea. Find your own contents to get your Korean! </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">Listening and Record</h3>
                            <p class="text-muted mb-0"> We service Shadowing and translation Service. You can read and listen Korean pronunciation.
                            You can also recording your voice and check your skills. </p>
                        </div>
                    </div>
                    
            </div>
        </section>
        
        <div id="space_little"></div>
 
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://img.vogue.co.kr/vogue/2020/05/style_5ec3376f1cd53-643x930.jpeg" title="Signal">
                            <img class="img-fluid" src="https://img.vogue.co.kr/vogue/2020/05/style_5ec3376f1cd53-643x930.jpeg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Drama</div>
                                <div class="project-name">Signal</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://0.soompi.io/wp-content/uploads/2020/02/05232122/kingdom-2-1.jpg" title="Kingdom">
                            <img class="img-fluid" src="https://0.soompi.io/wp-content/uploads/2020/02/05232122/kingdom-2-1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Drama</div>
                                <div class="project-name">Kingdom</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://w0.peakpx.com/wallpaper/288/777/HD-wallpaper-movie-parasite.jpg" title="Parasite">
                            <img class="img-fluid" src="https://w0.peakpx.com/wallpaper/288/777/HD-wallpaper-movie-parasite.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Movie</div>
                                <div class="project-name">Parasite</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://w.namu.la/s/fac6c7163fd1a2ef6b3b319d6a8e477a8a2696ce4c6bcffb3de28909978a171c67522e46c10ecf03998018871cba3580c49020f74792a05f4d778e32d8e67baeb28cd7f1015dda531f5abd1b84703d0ad9a2672d6e8e2f0ad63ccbeaf7b86683" title="Reply 1988">
                            <img class="img-fluid" src="https://w.namu.la/s/fac6c7163fd1a2ef6b3b319d6a8e477a8a2696ce4c6bcffb3de28909978a171c67522e46c10ecf03998018871cba3580c49020f74792a05f4d778e32d8e67baeb28cd7f1015dda531f5abd1b84703d0ad9a2672d6e8e2f0ad63ccbeaf7b86683" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Drama</div>
                                <div class="project-name">Reply 1988</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://w.namu.la/s/912bde0c4a0b2e7be286896a157e86968e1a1ae608278451f7a6f6f10cb86f537e7e334d71237ec6052808d189b8586f61b4afa8e4d301dbeb7cc45d774a72a1423eb3c81a14d8e547d8cc7c24daae3c" title="Kpop">
                            <img class="img-fluid" src="https://w.namu.la/s/912bde0c4a0b2e7be286896a157e86968e1a1ae608278451f7a6f6f10cb86f537e7e334d71237ec6052808d189b8586f61b4afa8e4d301dbeb7cc45d774a72a1423eb3c81a14d8e547d8cc7c24daae3c" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Kpop</div>
                                <div class="project-name">BTS-Love yourself 結 'Answer'</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://cutewallpaper.org/21/running-man-wallpaper/Running-Man-Running-Man-Wallpaper-1280x768-86534-.png" title="Running man">
                            <img class="img-fluid" src="https://cutewallpaper.org/21/running-man-wallpaper/Running-Man-Running-Man-Wallpaper-1280x768-86534-.png" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Variety Show</div>
                                <div class="project-name">Running man</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="space_little"></div>
        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - Kulture</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
