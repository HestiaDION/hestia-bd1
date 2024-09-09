import java.sql.ResultSet;
import java.sql.SQLException;

public class Boost extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id;
    private String tipoBoost;
    private double valor;
    private String dataInicio;
    private String dataTermino;
    // PROBLEMA
    private int idPagamento;
    // PROBLEMA

//    DEFINIÇÃO OS MÉTODOS getters E setters
    public Boost(String tipoBoost, double valor, String dataInicio, String dataTermino) {
        this.tipoBoost = tipoBoost;
        this.valor = valor;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
    }

//    DEFINIÇÃO DOS MÉTODOS getters E setters

//    DENIÇÃO MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM boost"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }

    // Retorna Registros Com O Tipo De Boost Especificado
    public ResultSet buscarTipoBoost(String tipoBoost) {
        ResultSet rs; // Instância objeto ResultSet para armazenar o resultado

        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE tipo_boost = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, tipoBoost);
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE valor > ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE valor < ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE dt_inicio = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE dt_termino = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, dataTermino);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            desconectar(); // Termina a conexão com o BD

            return rs; // Retorna o objeto ResultSet

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return null;
        }
    }
}
