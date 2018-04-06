package br.com.projcardapio.dados;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.mysql.jdbc.Statement;

import br.com.projcardapio.entidade.Pizza;
import br.com.projcardapio.entidade.Sabor;
import br.com.projcardapio.util.Conexao;

public class CadastroPizzaDB {

	private Connection connection;

	public CadastroPizzaDB() {

		connection = Conexao.getConnection();
	}

	public boolean inserir(Pizza cadastro) throws SQLException {

		try {
			PreparedStatement ps = this.connection.prepareStatement(
					"INSERT INTO TB_PIZZA (Nome, Valor, Descpro) values (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, cadastro.getNome());
			ps.setDouble(2, cadastro.getValor());
			ps.setDouble(3, cadastro.getDescpro());

			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			int generatedKey = 0;
			if (rs.next()) {
				generatedKey = rs.getInt(1);
			}

			cadastro.setId_pizza(generatedKey);

			if (!cadastro.lstSabores.equals("")) {
				ArrayList<String> parts = new ArrayList<>(Arrays.asList(cadastro.lstSabores.split("\\;")));
				List<Sabor> lstSabor = new ArrayList<>();

				for (int i = 0; i < parts.size(); i++) {
					Sabor s = new Sabor();
					s.setId_sabor(Integer.parseInt(parts.get(i)));
					lstSabor.add(s);
				}

				ps.close();
				for (Sabor sabor : lstSabor) {
					ps = this.connection
							.prepareStatement("INSERT INTO TB_PIZZA_SABOR (fk_id_pizza, fk_id_sabor) values (?, ?)");

					ps.setInt(1, cadastro.getId_pizza());
					ps.setInt(2, sabor.id_sabor);
					ps.execute();
				}

			}

			return true;

		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {
			connection.close();
		}

		return false;

	}

	public boolean alterar(Pizza cadastro) throws SQLException {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("UPDATE TB_PIZZA SET nome= ?,  valor= ?, descpro= ? WHERE id_pizza = ?");
			stmt.setString(1, cadastro.getNome());
			stmt.setDouble(2, cadastro.getValor());
			stmt.setDouble(3, cadastro.getDescpro());
			stmt.setInt(4, cadastro.getId_pizza());
			stmt.execute();

			if (!cadastro.lstSabores.equals("")) {
				ArrayList<String> parts = new ArrayList<>(Arrays.asList(cadastro.lstSabores.split("\\;")));
				List<Sabor> lstSabor = new ArrayList<>();

				for (int i = 0; i < parts.size(); i++) {
					Sabor s = new Sabor();
					s.setId_sabor(Integer.parseInt(parts.get(i)));
					lstSabor.add(s);
				}

				stmt.close();
				stmt = this.connection.prepareStatement("DELETE FROM tb_pizza_sabor WHERE fk_id_pizza = ?");
				stmt.setInt(1, cadastro.getId_pizza());
				stmt.execute();

				stmt.close();
				for (Sabor sabor : lstSabor) {
					stmt = this.connection
							.prepareStatement("INSERT INTO TB_PIZZA_SABOR (fk_id_pizza, fk_id_sabor) values (?, ?)");

					stmt.setInt(1, cadastro.getId_pizza());
					stmt.setInt(2, sabor.id_sabor);
					stmt.execute();
				}

			}
			return true;
		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {
			connection.close();
		}
		return false;
	}

	public List<Pizza> getAll() {

		List<Pizza> lstcadastro = new ArrayList<>();
		try {
			PreparedStatement ps = this.connection
					.prepareStatement("SELECT id_pizza, nome, valor, descpro FROM TB_PIZZA");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// Consulto Sabores
				List<Sabor> lstSabores = new CadastroSaborDB().GetSaboresToPizza(rs.getInt("id_pizza"));

				String sabores = "";
				String nomeSabores = "";
				// Concateno com pipe
				for (Sabor sabor : lstSabores) {
					sabores = sabores + sabor.id_sabor + ";";
					nomeSabores = nomeSabores + sabor.nome + ",";
				}

				nomeSabores = nomeSabores.substring(0, nomeSabores.length() - 1);

				lstcadastro.add(new Pizza(rs.getInt("id_pizza"), rs.getString("nome"), rs.getDouble("valor"), sabores,
						nomeSabores, rs.getDouble("descpro")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lstcadastro;
	}

	public boolean excluir(int id_pizza) throws SQLException {
		try {
			PreparedStatement ps = this.connection.prepareStatement("DELETE FROM tb_pizza_sabor WHERE fk_id_pizza = ?");
			ps.setInt(1, id_pizza);
			ps.execute();

			ps.close();
			ps = this.connection.prepareStatement("DELETE FROM tb_pizza WHERE id_pizza = ?");
			ps.setInt(1, id_pizza);
			ps.execute();

			return true;
		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {
			connection.close();
		}
		return false;
	}

	public boolean InserirPizzaSabor(List<Sabor> lstSabores, int id_pizza) throws SQLException {

		try {
			PreparedStatement ps = this.connection.prepareStatement("DELETE FROM tb_pizza_sabor WHERE fk_id_pizza = ?");
			ps.setInt(1, id_pizza);
			ps.execute();

			for (Sabor sabor : lstSabores) {
				ps = this.connection
						.prepareStatement("INSERT INTO TB_PIZZA_SABOR (fk_id_pizza, fk_id_sabor) values (?, ?)");

				ps.setInt(1, id_pizza);
				ps.setInt(2, sabor.id_sabor);
				ps.execute();

			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {

			connection.close();
		}

		return true;
	}
}
