import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Admin extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id;
    private String nome;
    private String email;
    private String senha;

//    DEFINIÇÃO DO MÉTODO CONSTRUTOR
    public Admin(String nome, String email, String senha) { // SERIA NECESSÁRIO ESPECIFICAR O ID?
        this.nome = nome;
        this.email = email;
        this.senha = senha;
    }

//    DEFINIÇÃO DOS MÉTODOS getters E setters



//    DEFINIÇÃO DOS MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com O Id Especificado
    public ResultSet buscarId(int id) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com O Nome Especificado
    public ResultSet buscarNome(String nome) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE nome = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, nome);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com O Email Especificado
    public ResultSet buscarEmail(String email) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, email);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

}
