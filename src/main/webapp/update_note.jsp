<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_cs_js.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@include file="navbar.jsp"%>
	<%
	int id= Integer.parseInt( request.getParameter("note_id").trim());
	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();
	Note note = (Note) s.get(Note.class, id);
	%>
	<form action="UpdateServlet" method="post">
		<input value="<%=note.getId()%>" type="hidden" name="note_id">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Note Title
				</label> <input name="title" required="required" type="text" class="form-control"
				id="note_title" value="<%=note.getTitle() %>" >
			
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label ">Note Content</label>
			<textarea name="content" required="required" class="form-control"  style= "height:200px" cols="">"<%=note.getContent()%></textarea>
		</div>		
		<button type="submit" class="btn btn-primary">Add</button>
	</form>
	<%
	tx.commit();
	s.close();	
	
	%>
</body>
</html>