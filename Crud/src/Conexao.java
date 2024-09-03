import java.sql.*;

public class Conexao {
    //    DEFINIÇÃO DOS ATRIBUTOS
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    //    DEFINIÇÃO MÉTODO CONECTAR --> Inicia conexão com o BD
    public boolean conect() {
        try {
            // Informa qual Driver será utilizado na conexão
            Class.forName("org.postgresql.Driver");

            // Estabelece a conexão com o BD
            conn = DriverManager.getConnection("jdbc:postgresql://pg-aplicativo-hestia24.k.aivencloud.com:23986/defaultdb?ssl=require&user=avnadmin&password=AVNS_3URGOb6MG5fTz7u4pnP");

            // Retorna verdadeiro ao término da execução
            return true;

        } catch (SQLException | ClassNotFoundException sqle) {
            sqle.printStackTrace();
        }
        // Retorna falso em caso de exceção
        return false;
    }
    //    DEFINIÇÃO DO MÉTODO DESCONECTAR
    public void disconect() {
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

    // MÉTODOS INSERT
    public boolean insert(){
        try{
            
        }
    }
    //  DEFINIÇÃO DOS MÉTODOS UPDATE
    public int changeValue(String table, String column, int id, String change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setString(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, char change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setString(3, String.valueOf(change));
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, int change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setInt(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, float change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setFloat(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, double change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setDouble(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, boolean change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setBoolean(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, Date change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setDate(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
    public int changeValue(String table, String column, int id, Time change){
        try{
            conect();

            pstmt = conn.prepareStatement("UPDATE ? SET ? = ? WHERE PESSOAID =?");

            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setTime(3, change);
            pstmt.setInt(4, id);

            int rows = pstmt.executeUpdate();
            disconect();

            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }

    //  DEFINIÇÃO DO MÉTODO REMOVER
    public int remove(String tabela, int id){
        try{
            conect();

            pstmt = conn.prepareStatement("DELETE FROM ? WHERE PESSOAID =?");
            pstmt.setString(1, tabela);
            pstmt.setInt(2, id);

            int rows = pstmt.executeUpdate();
            disconect();
            if (rows > 0){
                return 1;
            }else return 0;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;
        }
    }

    //  MÉTODOS SELECT (ANÁLISE DOS DADOS)
    public ResultSet listAll(String tabela){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ?");
            pstmt.setString(1, tabela);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, String condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setString(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, char condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setString(3, String.valueOf(condition));
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, int condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setInt(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, float condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setFloat(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, double condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setDouble(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, boolean condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setBoolean(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, Date condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setDate(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet listWhereEqual(String table, String column, Time condition){
        try{
            conect();
            pstmt = conn.prepareStatement("SELECT * FROM ? WHERE ? = ?");
            pstmt.setString(1, table);
            pstmt.setString(2, column);
            pstmt.setTime(3, condition);
            ResultSet rset = pstmt.executeQuery();
            disconect();
            return rset;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
        //  SELECTS POR TABELA
    //  TABELA UNIVERSITARIO

}
