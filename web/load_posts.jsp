<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%
    User uuu = (User) session.getAttribute("currentUser");
    if (uuu == null) {
        response.sendRedirect("login.jsp");
    }
%>
<div class="row">
    <% 
        Thread.sleep(500);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts =null;
        if(cid==0){
         posts = d.getAllPosts();
        }
        else{
         posts = d.getPostByCatId(cid);
        }
        if(posts.size()==0){
        out.println("<h3 class='display-3 text-center' >there no posts in this catagory...</h3>");
        }
       
        for (Post p : posts) {
    %>




    <div class="col-md-6 mt-2">
        <div class="card post-card h-100 shadow-lg">


            <img src="blog_pic/<%=p.getpPic() %>" class="card-img-top img-fluid" alt="Card image cap">

            <div class="card-body">
                <b class="card-title fw-bold" ><%= p.getpTitle()%></b>
                <p class="card-text">
                    <%--<%= p.getpContent()%>--%>
                    <%
                        String content = p.getpContent();
                        if (content != null && content.length() > 100) {
                            out.print(content.substring(0, 100) + "...");
                        } else {
                            out.print(content);
                        }
                    %>
                </p>  
                <!--code not added-->
                
            </div>
                <div class="card-footer d-flex justify-content-between align-items-center">
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                            %>
                            <a href="#" onclick="doLike(<%=p.getPid()%>,<%=uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-light btn-sm text-dark">Read more...</a>
                     
                    <!--<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>-->
                    
                </div>
            
;

        </div>
    </div>

    <%
        }

    %>
    

    <style>
/* Post card theme synced with navbar gradient */
.post-card {
    background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
    border-radius: 15px;
    overflow: hidden;
    color: #fff;
    backdrop-filter: blur(8px);
    transition: transform 0.3s, box-shadow 0.3s;
}

.post-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 15px 25px rgba(0, 0, 0, 0.35);
}

.post-card .card-title {
    text-shadow: 0 1px 3px rgba(0,0,0,0.7);
}

.post-card .card-text {
    text-shadow: 0 1px 2px rgba(0,0,0,0.6);
}

/* Footer overlay */
.post-card .card-footer {
    background: rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(6px);
}
</style>