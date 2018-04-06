<%@ page import="br.com.projcardapio.dados.CadastroPizzaDB"%>
<%@ page import="br.com.projcardapio.entidade.Pizza"%>
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
int id = Integer.parseInt(request.getParameter("id_pizza"));
String nome = request.getParameter("nome");
String valor = request.getParameter("valor");
String sabores = request.getParameter("ids_sabores");
String descpro = request.getParameter("descpro");

if(valor.equals("")){
	
	valor = "0";
}
if(descpro.equals("")){
	
	descpro = "0";
}
Pizza cadastro = new Pizza();

cadastro.setNome(nome);
cadastro.setValor(Double.parseDouble(valor.replace(',', '.')));
cadastro.setLstSabores(sabores);
cadastro.setDescpro(Double.parseDouble(descpro.replace(',', '.')));


if(id > 0){ 
	cadastro.id_pizza = id; 
	new CadastroPizzaDB().alterar(cadastro);
	
}else{ 
	new CadastroPizzaDB().inserir(cadastro); 
 } 
response.sendRedirect("consultarpizzas.jsp"); 
%>
</body>
</html>