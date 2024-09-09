import java.sql.ResultSet;
import java.sql.SQLException;

public class Plano extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id;
    private String nome;
    private double valor;
    private String dataInicio;
    private String dataTermino;
    private String info;

//    DEFINIÇÃO DO MÉTODO CONSTRUTOR


    
//    DEFINIÇÃO DOS MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE nome = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, nome);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com Um Valor Maior Do Que O Especificado
    public ResultSet buscarMaiorValor(double valor) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE valor > ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setDouble(1, valor);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com Um Valor Menor Do Que O Especificado
    public ResultSet buscarMenorValor(double valor) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE valor < ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setDouble(1, valor);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com A Data De Início Especificado
    public ResultSet buscarDataInicio(String dataInicio) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE dt_inicio = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, dataInicio);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com A Data De Término Especificado
    public ResultSet buscarDataTermino(String dataTermino) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE dt_termino = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, dataTermino);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    public int remover(int id) {
        conectar();  // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("DELETE FROM plano WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, id);
            pstmt.executeQuery(); // Executa o comando

            desconectar(); // Termina a conexão com o BD

            return 1; // Retorna true ao término da execução

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            desconectar(); // Termina a conexão com o BD

            return -1; // Retorna -1 em caso de exceção
        }
    }
}
