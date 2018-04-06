package br.com.projcardapio.entidade;

public class Sabor {

	public Sabor() {
		
	}
	
	public int id_sabor;
	public String nome;
	
	public Sabor(int id_sabor, String nome) {
		this.id_sabor=id_sabor;
		this.nome=nome;
	}
	public int getId_sabor() {
		return id_sabor;
	}
	public void setId_sabor(int id_sabor) {
		this.id_sabor = id_sabor;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
