<%@page import="teste.DependenciaDAO"%>
<%@ page import="teste.FilmeDAO" %>
<%@ page import="teste.Filme" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Filmes</title>
</head>
	<body>
		<table width="100%">
			<tr bgcolor="#c0c0c0">
				<td>Id</td>
				<td>Original Title</td>
				<td>Portuguese Title</td>
				<td>Categoria</td>
			</tr>
			<%
				DependenciaDAO depDoa = new DependenciaDAO();	
			
				FilmeDAO dao = new FilmeDAO();
				for(Filme filme : dao.getListaFilmes2()){
			%>
				<tr>
					<td><%=filme.getId() %></td>
					<td><%=filme.getOriginalTitle() %></td>
					<td><%=filme.getPtTitle() %></td>
					<td><%= depDoa.getById(filme.getDep().getId()).getDeclaration() %></td>
				</tr>
			<%
				}
			%>
		</table>
		<br />
		<br />
		<a href="cadastro.jsp" >Novo Cadastro</a>
	</body>
</html>