package br.com.projcardapio.entidade;

public class Pizza {

	public Pizza() {
		
	}
	public int id_pizza;
	public String nome;
	public double valor;
	public double descpro;
	public String lstSabores;
	public String lstNomeSabores;
	
	
	public String getLstNomeSabores() {
		return lstNomeSabores;
	}
	public void setLstNomeSabores(String lstNomeSabores) {
		this.lstNomeSabores = lstNomeSabores;
	}
	public String getLstSabores() {
		return lstSabores;
	}
	public void setLstSabores(String lstSabores) {
		this.lstSabores = lstSabores;
	}
	public Pizza(int id_pizza, String nome, double valor,String lstSabores,String lstnomeSabores, double descpro) {
		this.id_pizza=id_pizza;
		this.nome=nome;
		this.valor=valor;
		this.lstSabores =lstSabores;
		this.lstNomeSabores = lstnomeSabores;
		this.descpro = descpro;
	}
	public int getId_pizza() {
		return id_pizza;
	}
	public void setId_pizza(int id_pizza) {
		this.id_pizza = id_pizza;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public double getDescpro() {
		return descpro;
	}
	public void setDescpro(double descpro) {
		this.descpro = descpro;
	}
	
	
}
