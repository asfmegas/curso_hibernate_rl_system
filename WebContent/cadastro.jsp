<%@page import="teste.DependenciaDAO"%>
<%@page import="teste.Dependencia"%>
<%@page import="teste.FilmeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="teste.Filme" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
		<h1>Cadastro de filmes</h1>
		<form method="POST" action="filmeservlet">
			Original Title:<br /><input type="text" name="txtOriTitle" /><br />
			Portuguese Title:<br /><input type="text" name="txtPtTitle" /><br /> 
			<select name="optDep">
				<option value="0">-- Seleção --</option>
				<%
					DependenciaDAO dao = new DependenciaDAO();
					for(Dependencia dep : dao.getListaDep()){
				%>
					<option value="<%=dep.getId() %>"><%=dep.getDeclaration() %></option>
				<%
					}
				%>
			</select>
			<br />
			<br />
			<input type="submit" value="Cadastrar Filme" />
		</form>
		<br />
		<br />
		<a href="listarfilmes.jsp">Listar Filmes</a>
	</body>
</html>