package br.com.projcardapio.dados;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projcardapio.entidade.Pizza;
import br.com.projcardapio.entidade.Sabor;
import br.com.projcardapio.util.Conexao;



public class CadastroSaborDB {
	
	private Connection connection;	
	public CadastroSaborDB() {
		
		connection = Conexao.getConnection();
	}
	
	public boolean inserir (Sabor cadastro) throws SQLException{
		
		try {
			PreparedStatement ps = this.connection.prepareStatement("INSERT INTO tb_sabor (nome) values (?)");

			ps.setString(1, cadastro.getNome());

			ps.execute();
			return true;
			
		}catch(SQLException e){
			System.err.println(e.toString());	
		}finally {
			connection.close();
		}
		
		return false;
		
	}
	
	public boolean alterar(Sabor cadastro) throws SQLException { 
		try { 
			PreparedStatement stmt = this.connection 
					.prepareStatement("UPDATE TB_SABOR SET nome= ? WHERE id_sabor = ?"); 
			stmt.setString(1, cadastro.getNome());
			stmt.setInt(2, cadastro.id_sabor);
			stmt.execute(); 
			return true; 
		} catch (SQLException e) { 
			System.err.println(e.toString()); 
		} finally { 
			connection.close(); 
		} 
		return false; 
	} 
	
	public List<Sabor> getAll(){
		
		List<Sabor> lstcadastro = new ArrayList<>();
		try {
			PreparedStatement ps = this.connection.prepareStatement("SELECT id_sabor, nome FROM tb_sabor");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				lstcadastro.add(new Sabor(rs.getInt("id_sabor"), rs.getString("Nome")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lstcadastro;
	}
	
	public List<Sabor> GetSaboresToPizza(int id_pizza){
		List<Sabor> lstcadastro = new ArrayList<>();
		try {
			PreparedStatement ps = this.connection.prepareStatement("select id_sabor, nome \r\n" + 
					"from tb_pizza_sabor\r\n" + 
					"inner join tb_sabor on tb_sabor.id_sabor = tb_pizza_sabor.fk_id_sabor\r\n" + 
					"where fk_id_pizza = ?");
			ps.setInt(1, id_pizza);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				lstcadastro.add(new Sabor(rs.getInt("id_sabor"), rs.getString("Nome")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lstcadastro;
	}
	
	public boolean excluir(int id_sabor) throws SQLException { 
		try { 
			PreparedStatement stmt = this.connection 
					.prepareStatement("DELETE FROM TB_SABOR WHERE ID_SABOR =?"); 
			stmt.setInt(1, id_sabor); 
			stmt.execute(); 
			return true; 
		} catch (SQLException e) { 
			System.err.println(e.toString()); 
		} finally { 
			connection.close(); 
		} 
		return false; 
	} 

}
