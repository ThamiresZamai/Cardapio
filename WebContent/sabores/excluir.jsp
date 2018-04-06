<%@ page import="br.com.projcardapio.dados.CadastroSaborDB"%>
<%@ page import="br.com.projcardapio.entidade.Sabor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Excluir</title>
</head>
<body>
<%  
int id = Integer.parseInt(request.getParameter("id")); 
CadastroSaborDB db = new CadastroSaborDB(); 
db.excluir(id); 
response.sendRedirect("consultarsabores.jsp"); 
%> 
</body>
</html>