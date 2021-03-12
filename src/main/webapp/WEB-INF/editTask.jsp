<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Edit <c:out value="${thisTask.name}"></c:out> </title>
</head>
<body style="background-color: rgb(214 214 214)">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
			    <ul class="navbar-nav">
			    	<li class="nav-item">	
						<a class="nav-link active" aria-current="page"  href="/dashboard">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page"  href="/tasks/${thisTask.id}">Back</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
<h1>Edit: <c:out value="${thisTask.name}"></c:out></h1>
<%-- 	<p>Creator ID: <c:out value="${thisTask.creator.id}"/> ||| <c:out value="${thisUser.id}"/> --%>
	<form:form method="POST" action="/tasks/${thisTask.id}" modelAttribute="thisTask">
	<input type="hidden" name="_method" value="put">
	 <form:input type="hidden" value="${thisUser.id}" path="creator"/>
	 <form:input type="hidden" value="${thisTask.subTaskFor.id}" path="subTaskFor"/>
	 
		        <p>
		            <form:label path="name">Name:</form:label>
		            <form:input required="true" type="text" path="name"/>
		        </p>
		        <p>Assigned Team: 
                	<select name="assignedTeam">

				        <c:forEach items="${allTeams}" var="team">
				        <c:if test="${thisTask.assignedTeam.id == team.id}">
				        	<option selected value="${team.id}"><c:out value="${team.name }"/></option>
				        </c:if>
				        <c:if test="${team.id != thisTask.assignedTeam.id}">
				        	<option value="${team.id}"><c:out value="${team.name }"/></option>
				        </c:if>
				        </c:forEach>
 			       </select>
		        </p>
		        <p>Assigned to:
		            <select name="assignee">
				        <c:forEach items="${thisTeam.teamMembers}" var="users">
				        	<option value="${users.id}"><c:out value="${users.name }"/></option>
				        </c:forEach>
 			       </select>
		        </p>
		        <p>Priority: 
		            <select name="priority">
		            	<option value ="9">High</option>
		            	<option value ="5">Medium</option>
		            	<option value ="1">Low</option>
		            </select>
		        </p>
		        
		        <input type="submit" value="Edit"/>
		    </form:form>

</body>
</html>