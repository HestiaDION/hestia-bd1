public class Main {
    public static void main(String[] args) {
//        DECLARAÇÃO DE VARIÁVEIS E INSTANCIAÇÃO DE OBJETOS
        Conexao conexao = new Conexao();

        // Conectando com o BD
        conexao.conectar();

        // Finalizando a conexão com o BD
        conexao.desconectar();
    }
}

// COMO VAMOS FAZER A INSERÇÃO DO ID EM CADA REGISTRO?