<%@ page import="br.com.projcardapio.dados.CadastroPizzaDB"%>
<%@ page import="br.com.projcardapio.entidade.Pizza"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
<script type="text/javascript" src="../bootstrap/jquery-3.3.1.min.js"></script> 
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script> 
  
<head>

	<title>Cardápio</title>
	<style>
body {
    background-image: url("fotopizza4.jpg"); 
    background-repeat: repeat;
	}
</style>
</head>
<body>

<h1 style="color: #ff0000", align="center">Pizzaria Melhor Massa</h1>

<div class="container">
  <h2>O melhor da pizza </h2>
  <p>Temos diversas opções:</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Pizza</th>
        <th>Ingredientes</th>
        <th>Valor</th>
      </tr>
    </thead>
    <tbody>
    <%for (Pizza cadastro : new CadastroPizzaDB().getAll()){%>
    <tr>
      	<td><%=cadastro.getNome() %></td>
     	<td><%=cadastro.getLstNomeSabores() %></td>
   		<td><%=(cadastro.getDescpro()>0 && cadastro.getValor()>0?((cadastro.getValor()*cadastro.getDescpro())/100):cadastro.getValor()) %></td>
   		<td>
   		<%if(cadastro.getDescpro() > 0 && cadastro.getValor()>0) { %>
   			<img src="promocao2.png" height="32" width="55">
   		
   		<%}%>
   		</td>
    </tr>
    <%}%>
    </tbody>
  </table>
</div>

</body>
</html>

</body>
</html>