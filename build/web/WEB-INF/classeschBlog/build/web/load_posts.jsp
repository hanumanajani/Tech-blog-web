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
        <div class="card">


            <img src="blog_pic/<%=p.getpPic() %>" class="card-img-top" alt="Card image cap">

            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
                
            </div>
                <div class="card-footer text-center primary-background">
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                            %>
                            <a href="#" onclick="doLike(<%=p.getPid()%>,<%=uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>
                     
                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                    
                </div>
            
;

        </div>
    </div>

    <%
        }

    %>