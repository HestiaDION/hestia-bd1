import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexao {
    //    DEFINIÇÃO DOS ATRIBUTOS
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    //    DEFINIÇÃO MÉTODO CONECTAR --> Inicia conexão com o BD
    public boolean conectar() {
        try {
            // Informa qual Driver será utilizado na conexão
            Class.forName("org.postgresql.Driver");

            // Estabelece a conexão com o BD
            conn = DriverManager.getConnection("jdbc:postgresql://pg-aplicativo-hestia24.k.aivencloud.com:23986/defaultdb?ssl=require&user=avnadmin&password=AVNS_3URGOb6MG5fTz7u4pnP");

            // Retorna verdadeiro ao término da execução
            return true;

        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }

        // Retorna falso em caso de exceção
        return false;
    }

    //    DEFINIÇÃO DO MÉTODO DESCONECTAR
    public void desconectar() {
        try {
            // Verifica se a conexão está ativa
            if (conn != null && !conn.isClosed()) {
                // Finaliza a conexão
                conn.close();
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
