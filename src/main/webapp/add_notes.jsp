<!doctype html>
<html lang="en">
<head>
<%@include file="all_cs_js.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
<div class="container">
	<form action="SaveNoteServlet" method="post">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Note Title
				</label> <input name="title" required="required" type="text" class="form-control"
				id="note_title" >
			
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Note Content</label>
			<textarea name="content" required="required" class="form-control" cols=""></textarea>
		</div>
		
		<button type="submit" class="btn btn-primary">Add</button>
	</form>
</div>

</body>
</html>