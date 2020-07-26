<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<%
Thread.sleep(100);
PostDao dao=new PostDao((Connection) ConnectionProvider.getCon()); 
int uid=Integer.parseInt(request.getParameter("uid"));
List<Posts> posts=null;


if(uid>0){
	posts=dao.getPostByUid(uid);
}else{
	posts=dao.getAllPosts();
}


//posts=dao.getPostByUid(uid);

if(posts.size()==0)
{
	response.getWriter().println("No posts");
	return;
}
for (Posts p:posts){
%>
<div class="col-md-6 mt-2">
 <div class="card">
 <div class="card-body">
    <h2><b><%=p.getpTitle()%></b></h2>
    <p><%=p.getpContent()%><p>
 </div>
 </div>
<div class="card-footer primary-background text-center">
    <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
    <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span></span>  </a>
</div>
</div>
<%}%>