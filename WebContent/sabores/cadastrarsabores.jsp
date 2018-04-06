<%@ page import="br.com.projcardapio.dados.CadastroSaborDB"%>
<%@ page import="br.com.projcardapio.entidade.Sabor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar</title>
</head>
<body>
<% 
int id = Integer.parseInt(request.getParameter("id_sabor"));
String nome = request.getParameter("nome");

Sabor cadastro = new Sabor();

cadastro.setNome(nome);

if(id > 0){ 
	cadastro.id_sabor = id; 
	new CadastroSaborDB().alterar(cadastro);
	
}else{ 
	new CadastroSaborDB().inserir(cadastro); 
 } 
response.sendRedirect("consultarsabores.jsp"); 
%>
</body>
</html>