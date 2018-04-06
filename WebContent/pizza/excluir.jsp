<%@ page import="br.com.projcardapio.dados.CadastroPizzaDB"%>
<%@ page import="br.com.projcardapio.entidade.Pizza"%>
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
CadastroPizzaDB db = new CadastroPizzaDB(); 
db.excluir(id); 
response.sendRedirect("consultarpizzas.jsp"); 
%> 
</body>
</html>