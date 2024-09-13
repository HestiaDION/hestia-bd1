import java.sql.ResultSet;
import java.sql.SQLException;

public class Boost extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id; // O ID VAI SER INDICADO PELO ADMINISTRADOR?
    private String tipoBoost;
    private double valor;
    private String dataInicio;
    private String dataTermino;
    private int idPagamento; // FAZER MÉTODO DE PROCURA PELO ID E FAZER MÉTODO DE SELEÇÃO DO ID

//    DEFINIÇÃO OS MÉTODOS getters E setters
    public Boost(String tipoBoost, double valor, String dataInicio, String dataTermino, int idPagamento) {
        this.tipoBoost = tipoBoost;
        this.valor = valor;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.idPagamento = idPagamento; // FAZER MÉTODO DE SELECT * DENTRO DA CLASSE PARA MOSTRAR NA "SELEÇÃO DINÂMICA"
    }

//    DEFINIÇÃO DOS MÉTODOS getters E setters --> NÃO FAZER AINDA


//    DEFINIÇÃO MÉTODOS DE CONSULTA AO BD
    // Retorna Todos Os Registros Da Tabela
    public ResultSet buscarTodos() {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM boost"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com O Tipo De Boost Especificado
    public ResultSet buscarTipoBoost(String tipoBoost) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE tipo_boost = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, tipoBoost);
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE valor > ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE valor < ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE dt_inicio = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE dt_termino = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setString(1, dataTermino);
            rs = pstmt.executeQuery(); // Executando o comando e armazenando o resultado em um objeto ResultSet

            return rs; // Retorna o objeto ResultSet
        
        } catch (SQLException sqle) {
            return null; // Retorna vazio em caso de exceção
            
        } finally {
            desconectar(); // Encerra a conexão antes de fazer o retorno
        }
    }

    // Retorna Registros Com O ID de Pagamento Especificado
    public ResultSet buscarIdPagamento(int idPagamento) {
        conectar(); // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("SELECT * FROM boost WHERE id_pagamento = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
            pstmt.setInt(1, idPagamento);
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
            pstmt = conn.prepareStatement("DELETE FROM boost WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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
