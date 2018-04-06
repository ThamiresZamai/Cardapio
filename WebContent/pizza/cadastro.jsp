<%@ page import="br.com.projcardapio.dados.CadastroSaborDB"%>
<%@ page import="br.com.projcardapio.entidade.Sabor"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro</title>

<link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
<script type="text/javascript" src="../bootstrap/jquery-3.3.1.min.js"></script> 
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	$('#addbtn').click(function(){
		var newitem = $('#add').val();
		var uniqid = Math.round(new Date().getTime() + (Math.random() * 100));
		$('#list').append('<li id="'+uniqid+'" class="list-inline-item" value="'+ $("#sltSabores option:selected").val()  +'"><input type="button" data-id="'+uniqid+'" class="listelement" value="X" /> '+newitem+'<input type="hidden" name="listed[]" value="'+newitem+'"></li>');
		$('#add').val('');
		 $('#sltSabores').change();
		return false;
	});
    $('#list').delegate(".listelement", "click", function() {
		var elemid = $(this).attr('data-id');
		$("#"+elemid).remove();
    });
    
    $('#add').hide();
    $('#sltSabores').change(function(){
    	$('#add').val($("#sltSabores option:selected").text());    	
    });
    
    $('#sltSabores').change();
});
</script>
</head>
<body>
<div align="center">
		<h1>Pizza</h1>
		<form action="cadastrarpizzas.jsp" method="post">
		
		<input type="hidden" class="form-control" id="id_pizza" name="id_pizza" value="${param.id_pizza}">
		 <input type="hidden" class="form-control" id="ids_sabores" name="ids_sabores" value="${param.lstSabores}">
		 <input type="hidden" id="sabores">
			<div class="col-md-6">

				<div class="form-group">
					<div class="row">
						<label for="nome">Nome</label> <input type="text"
							class="form-control" id="nome" name="nome" value="${param.nome}">
				</div>
				<div class="form-group">
					<div class="row">
						<label for="nome">Valor</label> <input type="text"
							class="form-control" id="valor" name="valor" value="${param.valor}">
					</div>
					<div class="form-group">
					<div class="row">
						<label for="nome">Desconto para promoção(%)</label> <input type="text"
							class="form-control" id="descpro" name="descpro" value="${param.descpro}">
					</div>
				</div>
				
					<a href="../sabores/consultarsabores.jsp?id_pizzar=0" class="btn btn-danger">Consultar/Cadastrar Sabores</a>
					<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalSabores" onclick="carregaSabores()">Adicionar/Remover Sabores</button> 
					<input type="submit" value="Salvar" class="btn btn-danger" />
					<a href="consultarpizzas.jsp" class="btn btn-light">Cancelar Cadastro</a>
								
			</div>
		</form>
	</div>

<!-- Modal --> 
<div class="modal fade" id="modalSabores" codigoExcluir="0" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
  <div class="modal-dialog" role="document"> 
    <div class="modal-content"> 
      <div class="modal-header"> 
        <h5 class="modal-title" id="exampleModalLabel">Sabores</h5> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
          <span aria-hidden="true">&times;</span> 
        </button> 
      </div> 
      <div class="modal-body"> 
      <div class="form-group">
	      <select id="sltSabores">
			<%for (Sabor cadastro : new CadastroSaborDB().getAll()){%>
				  <option value="<%=cadastro.id_sabor %>"><%=cadastro.nome %></option>
		    <%}%>      
		  </select> 
		  <input type="text" name="item" id="add">
	   	  <input type="button" id="addbtn" name="addbtn" value="Adicionar" class="btn btn-primary btn-sm" />
	   </div>
	  <div class="form-group">
          <ul id="list" class="list-inline">
          </ul>
      </div>
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button> 
        <button type="button" class="btn btn-warning" onclick="salvarSaboresNaTag()" data-dismiss="modal">Salvar</button> 
      </div> 
    </div> 
	</div> 
</div> 
<script>
function carregaSabores() {
	$('#list li').remove();	
	var arraySabores =  $('#ids_sabores').val().split(';');
	
	if(arraySabores.length > 0){
		
		for (var i = 0; i < arraySabores.length; i++) {
			if(arraySabores[i] != ""){
				$('#sltSabores option[value="'+ arraySabores[i]+'"]').prop('selected', true);
				
				var newitem = $("#sltSabores option:selected").text();
				var uniqid = Math.round(new Date().getTime() + (Math.random() * 100));
				$('#list').append('<li id="'+uniqid+'" class="list-inline-item" value="'+ $("#sltSabores option:selected").val()  +'"><input type="button" data-id="'+uniqid+'" class="listelement" value="X" /> '+newitem+'<input type="hidden" name="listed[]" value="'+newitem+'"></li>');
				
			}
		}
	}
}

function salvarSaboresNaTag(){
	$('#ids_sabores').val('');
	
	$("li").each(function(index,valor) {
		var valueold = $('#ids_sabores').val();
		
		$('#ids_sabores').val(valueold + valor.value + ";");
	});

}
</script>
</body>
</html>