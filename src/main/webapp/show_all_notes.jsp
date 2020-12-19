<!doctype html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Transaction"%>
<html lang="en">
<head>
<%@include file="all_cs_js.jsp"%>
<title>Note Taker</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div class="row">
		<div class="col-12">

			<%
				org.hibernate.Session s = FactoryProvider.getFactory().openSession();
			Query q = s.createQuery("from Note");
			List<Note> list = q.list();
			for (Note note : list) {
			%>
			<div class="card center mt-3 " style="width: 36rem;">
				<img src="image/note-icon.png " style="max-width:100px; " class="card-img-top pl-4" alt="...">
				<div class="card-body">
					<h5 class="card-title"><%=note.getTitle() %></h5>
					<p class="card-text"><%=note.getContent() %></p>
				
					<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
					<a href="update_note.jsp?note_id=<%=note.getId() %>" class="btn btn-warning">Update</a>
					
				</div>
				</div>
			<%
				}

			s.close();
			%>
		</div>
	</div>



</body>
</html>