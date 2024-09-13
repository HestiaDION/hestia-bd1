import java.sql.SQLException;

public class Pagamento extends Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    private int id; // O ID VAI SER INDICADO PELO ADMINISTRADOR?
    private double total;
    private String tipoPagamento;
    private double percentualDesconto;
    private String dataPagamento;
    private int idAnunciante;
    private int idAnuncio;
    private int idPlano;
    private int idUniversitario;

//    DEFINIÇÃO DO MÉTODO CONSTRUTOR
    public Pagamento(double total, String tipoPagamento, double percentualDesconto, String dataPagamento, int idAnunciante, int idAnuncio, int idPlano, int idUniversitario) {
        this.total = total;
        this.tipoPagamento = tipoPagamento;
        this.percentualDesconto = percentualDesconto;
        this.dataPagamento = dataPagamento;
        this.idAnunciante = idAnunciante; // FAZER MÉTODO DE SELECT * DENTRO DA CLASSE PARA MOSTRAR NA "SELEÇÃO DINÂMICA"
        this.idAnuncio = idAnuncio; // FAZER MÉTODO DE SELECT * DENTRO DA CLASSE PARA MOSTRAR NA "SELEÇÃO DINÂMICA"
        this.idPlano = idPlano; // FAZER MÉTODO DE SELECT * DENTRO DA CLASSE PARA MOSTRAR NA "SELEÇÃO DINÂMICA"
        this.idUniversitario = idUniversitario; // FAZER MÉTODO DE SELECT * DENTRO DA CLASSE PARA MOSTRAR NA "SELEÇÃO DINÂMICA"
    }

//    DEFINIÇÃO OS MÉTODOS getters E setters


//    DEFINIÇÃO MÉTODOS DE CONSULTA AO BD


//    DEFINIÇÃO DO MÉTODO DE REMOÇÃO DE REGISTROS NO BD
    public int removerRegistro(int id) {
        int registrosAfetados;

        conectar();  // Inicia a conexão com o BD

        try {
            pstmt = conn.prepareStatement("DELETE FROM pagamento WHERE id = ?"); // Prepara a instrução SQL, instanciando um objeto preparedStatment
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