import java.sql.ResultSet;
import java.sql.SQLException;

public class Plano extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id; // O ID VAI SER INDICADO PELO ADMINISTRADOR?
    private String nome;
    private double valor;
    private String dataInicio;
    private String dataTermino;
    private String info;

//    DEFINIÇÃO DO MÉTODO CONSTRUTOR
    public Plano(String nome, double valor, String dataInicio, String dataTermino, String info) {
        this.nome = nome;
        this.valor = valor;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.info = info;
    }

//    DEFINIÇÃO DOS MÉTODOS getters E setters

    
//    DEFINIÇÃO DOS MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE nome = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, nome);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com Um Valor Maior Do Que O Especificado
    public ResultSet buscarMaiorValor(double valor) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE valor > ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setDouble(1, valor);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com Um Valor Menor Do Que O Especificado
    public ResultSet buscarMenorValor(double valor) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE valor < ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setDouble(1, valor);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com A Data De Início Especificado
    public ResultSet buscarDataInicio(String dataInicio) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE dt_inicio = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, dataInicio);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com A Data De Término Especificado
    public ResultSet buscarDataTermino(String dataTermino) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM plano WHERE dt_termino = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, dataTermino);
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
            pstmt = conn.prepareStatement("DELETE FROM plano WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
