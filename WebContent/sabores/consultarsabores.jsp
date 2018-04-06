<%@ page import="br.com.projcardapio.dados.CadastroSaborDB"%>
<%@ page import="br.com.projcardapio.entidade.Sabor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Consulta de Sabores</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
<script type="text/javascript" src="../bootstrap/jquery-3.3.1.min.js"></script> 
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script> 
</head>
<body>

<div style="padding-top: 5%"></div>
<div class="col-sm-6">
<h1>Consulta de sabores</h1>
<div style="padding-top: 5%"></div>
<a href="cadastro.jsp?id_sabor=0" class="btn btn-danger">Novo</a>

<div style="padding-top: 3%"></div>
<input type="hidden" class="form-control" id="id_sabor" name="id_sabor">
<table class="table table-hover table-danger">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome</th>
    </tr>
  </thead>
  <tbody>
    <%for (Sabor cadastro : new CadastroSaborDB().getAll()){%>
    <tr>
      <th scope="row"><%=cadastro.id_sabor %></th>
      <td><%=cadastro.getNome() %></td>
     
      <td>   
		<button class="btn btn-info" onclick="alterar(<%=cadastro.id_sabor %>, '<%=cadastro.getNome() %>')">Alterar</button> 
	    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#confexcluir" onclick="salvaCodigo(<%=cadastro.id_sabor %>)">Excluir</button> 
	</td> 
    </tr>
    <%}%>
  </tbody>
</table>
</div>

<!-- Modal --> 
<div class="modal fade" id="confexcluir" codigoExcluir="0" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
  <div class="modal-dialog" role="document"> 
    <div class="modal-content"> 
      <div class="modal-header"> 
        <h5 class="modal-title" id="exampleModalLabel">Confirmação</h5> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
          <span aria-hidden="true">&times;</span> 
        </button> 
      </div> 
      <div class="modal-body"> 
        Tem certeza que deseja excluir este sabor? 
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button> 
        <button type="button" class="btn btn-warning" onclick="excluir()">Sim</button> 
      </div> 
    </div> 
	</div> 
</div> 
</body>
<script> 
function alterar(id, nome) { 
   location.href="cadastro.jsp?id_sabor="+id+"&nome="+nome;	 
} 

function excluir() { 
	location.href="excluir.jsp?id="+$("#confexcluir").attr('codigoExcluir');;	 
} 

function salvaCodigo(codigo) {
	   
	$("#confexcluir").attr('codigoExcluir',codigo);
}

</script> 
</html>