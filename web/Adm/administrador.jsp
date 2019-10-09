<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./style.css">
        
        <title>Admin</title>
        <style>
            #botaoCadastrar {
                margin-left: 865px;
            }
            
            h3 {
                align-items: center;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <nav id="leftnav">
                <div id="logo">
                    Admin<span>Panel</span>
                </div>
                <ul id="menu">
                    <li><a id="home">Home</a></li>
                    <li><a id="entidade">Entidades</a></li>
                    <li><a id="campanha">Campanhas</a></li>
                    <li><a id="doacoes">Doações</a></li>
                    <li><a id="player">Players</a></li>
                </ul>
                <div id="minimize" class="minimize">
                    &lt;
                </div>
            </nav>
            <header id="topnav">
                <div id="links">
                    <a id="exit">Sair</a>
                </div>
            </header>
            <main id="main">
                <div id="maximize" class="maximize">
                    &gt;
                </div>
                <div id="actions-container" class="actions-container">
                    <div id="home-actions">
                        <div class="title">
                            Home
                        </div>
                    </div>
                    <div id="entidades-actions">
                        <div class="title">
                            Entidades
                        </div>
                        <div class="row">
                            <div id="botaoCadastrar" class="col-md-6">
                                <a href="./Funcoes/addEntidades.jsp" class="btn btn-primary">Adicionar Entidade</a>
                            </div>
                        </div>
                            
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Causa</th>
                                    <th>Endereço</th>
                                    <th>Email</th>
                                    <th>Telefone</th>
                                    <th>Funções</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection connEntidade = DBConnection.getConnection();
                                    Statement statEntidade = connEntidade.createStatement();

                                    String dataEntidade = "select * from Entidade";
                                    ResultSet rsEntin = statEntidade.executeQuery(dataEntidade);

                                    while(rsEntin.next()) {
                                %>  
                                <tr>
                                    <td><%=rsEntin.getString("id")%></td>
                                    <td><%=rsEntin.getString("Nome")%></td>
                                    <td><%=rsEntin.getString("Causa")%></td>
                                    <td><%=rsEntin.getString("Endereco")%></td>
                                    <td><%=rsEntin.getString("Email")%></td>
                                    <td><%=rsEntin.getString("Telefone")%></td>
                                    <td>
                                    <a href="./Funcoes/editarEntidade.jsp?u=<%=rsEntin.getString("id")%>" class="btn btn-warning">Editar</a>
                                    <a href='../deleteEntidade?d=<%=rsEntin.getString("id")%>' class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                        
                    </div>
                    <div id="campanhas-actions">
                        <div class="title">
                            Campanhas
                        </div>
                    </div>
                    <div id="doacoes-actions">
                        <div class="title">
                            Doações
                        </div>
                    </div>
                    <div id="players-actions">
                        <div class="title">
                            Players
                        </div>
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Sobrenome</th>
                                    <th>Email</th>
                                    <th>Cargo</th>
                                    <th>Unidade</th>
                                    <th>Funções</th>
                                </tr>
                            </thead>
                            
                            <%
                               Connection conn = DBConnection.getConnection();
                               Statement stat = conn.createStatement();
                               
                               String data = "select * from softplayer";
                               ResultSet rs = stat.executeQuery(data);

                               while(rs.next()) {
                            %>
                             <tr>
                                <td><%=rs.getString("id")%></td>
                                <td><%=rs.getString("nome")%></td>
                                <td><%=rs.getString("sobrenome")%></td>
                                <td><%=rs.getString("email")%></td>
                                <td><%=rs.getString("cargo")%></td>
                                <td><%=rs.getString("unidade")%></td>
                                <td>
                                    <a href='../deletePlayers?d=<%=rs.getString("id")%>' class="btn btn-danger">Delete</a>
                                </td>

                             </tr>
                            <%
                             }
                            %>
                            
                        </table>
                    </div>
                </div>
            </main>
        </div>
        <script src="admin.js"></script>
    </body>
</html>

