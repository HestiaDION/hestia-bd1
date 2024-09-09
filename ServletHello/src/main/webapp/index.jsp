<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">HellXSo Servlet</a>
</body>
</html>

<%--GET é o método padrão de requisição:
- Ele não altera o estado do banco;
- É mais ágil por conta do armazenamento no cache;
- Faz suas requisões na URL, menos seguro (requisão é um pedido, ela não faz nada em sí).--%>

<%--POST é um método que não vem como padrão:
- Ele empacota a requisição, sendo mais eficiente em enviar informações maiores;
- É mais seguro por conta do empacotamento;
- Pode alterar o estado do banco.--%>

<%--REQUEST e RESPONDSE, objetos para executar as requisições:
- São objetos responsáveis por fazer o que é pedido nas requisções,
e são chamados pelo Cointainer.--%>

<%--ENDPOINT ou value --> Última coisa que está na URL, a página que está sendo acessada--%>