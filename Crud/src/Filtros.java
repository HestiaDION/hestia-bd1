import java.sql.ResultSet;
import java.sql.SQLException;

public class Filtros extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id;
    private String nome;

//    DEFINIÇÃO DO MÉTODO CONSTRUTOR
    public Filtros(String nome) {
        this.nome = nome;
    }

//    DEFNIÇÃO DOS MÉTODOS getters E setters



//    DEFINIÇÃO DOS MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM filtros"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM filtros WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM filtros WHERE nome = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, nome);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }
}
