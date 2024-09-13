import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
//    DEFINIÇÃO DOS ATRIBUTOS
    protected Connection conn;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

//    DEFINIÇÃO MÉTODO conectar --> Inicia conexão com o BD
    public boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver"); // Informa qual Driver será utilizado na conexão
            conn = DriverManager.getConnection("jdbc:postgresql://pg-aplicativo-hestia24.k.aivencloud.com:23986/defaultdb?ssl=require&user=avnadmin&password=AVNS_3URGOb6MG5fTz7u4pnP"); // Estabelece a conexão com o BD

            return true; // Retorna verdadeiro se obter sucesso

        } catch (SQLException | ClassNotFoundException sqle) {
            sqle.printStackTrace();

            return false; // Retorna falso em caso de exceção
        }
    }

//    DEFINIÇÃO DO MÉTODO desconectar --> Finaliza a conexão com o BD
    public boolean desconectar() {
        try {
            // Verifica se a conexão está ativa
            if (conn != null && !conn.isClosed()) {
                conn.close(); // Finaliza a conexão
            }

            return true; // Retorna verdadeiro se obter sucesso

        } catch (SQLException sqle) {
            sqle.printStackTrace();

            return false; // Retorna falso em caso de exceção
        }
    }
}

// INSERT E UPDATE
// COLOCAR RETORNO CASO NÃO ENCONTRE NADA

// SELECTS NO PAGAMENTO