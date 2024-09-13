import java.sql.ResultSet;
import java.sql.SQLException;

public class Admin extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id; // O ID VAI SER INDICADO PELO ADMINISTRADOR?
    private String nome;
    private String email;
    private String senha;

//    DEFINIÇÃO DO MÉTODO CONSTRUTOR
    public Admin(String nome, String email, String senha) { // SERIA NECESSÁRIO ESPECIFICAR O ID?
        this.nome = nome;
        this.email = email;
        this.senha = senha;
    }

//    DEFINIÇÃO DOS MÉTODOS getters E setters --> NÃO FAZER AINDA


//    DEFINIÇÃO DOS MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com O Id Especificado
    public ResultSet buscarId(int id) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com O Nome Especificado
    public ResultSet buscarNome(String nome) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE nome = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, nome);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com O Email Especificado
    public ResultSet buscarEmail(String email) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, email);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

//    DEFINIÇÃO DO MÉTODO DE REMOÇÃO DE REGISTROS NO BD
    public int removerRegistro(int id) {
        int registrosAfetados;

        conectar();  // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("DELETE FROM admin WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, id);
            registrosAfetados =  pstmt.executeUpdate(); // Executa o comando

            return registrosAfetados; // Retorna o número de registros afetados

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return -1; // Retorna -1 em caso de exceção

        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }
}
