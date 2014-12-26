<%@ page import="teste.Dependencia" %>
<%@ page import="teste.DependenciaDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Depepndencia</title>
</head>
<body>
			<table width="100%">
			<tr bgcolor="#c0c0c0">
				<td>Id</td>
				<td>Dependência</td>
			</tr>
			<%
				DependenciaDAO dao = new DependenciaDAO();
				for(Dependencia dep : dao.getListaDep()){
			%>
				<tr>
					<td><%=dep.getId() %></td>
					<td><%=dep.getDeclaration() %></td>
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