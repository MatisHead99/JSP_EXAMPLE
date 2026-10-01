<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ejemplo 2: Scriptlets en JSP</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; max-width: 700px; }
        .ejemplo { background-color: #fff3cd; padding: 15px; margin: 10px 0; border-left: 4px solid #ffc107; }
        .code { background-color: #e0e0e0; padding: 10px; font-family: monospace; overflow-x: auto; }
        h2 { color: #ffc107; }
        .resultado { color: #27ae60; font-weight: bold; }
        ul { list-style-type: none; }
        li { padding: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ejemplo 2: Scriptlets &lt;% %&gt;</h1>
        <p>Los scriptlets permiten escribir código Java dentro de JSP para lógica más compleja.</p>

        <div class="ejemplo">
            <h2>1. Declarar Variables</h2>
            <div class="code">
&lt;%
    String ciudad = "Bogotá";
    int temperatura = 22;
%&gt;
            </div>
            <%
                String ciudad = "Bogotá";
                int temperatura = 22;
            %>
            <p class="resultado">Resultado: <%= ciudad %> - Temperatura: <%= temperatura %>°C</p>
        </div>

        <div class="ejemplo">
            <h2>2. Condicional if-else</h2>
            <div class="code">
&lt;%
    if (temperatura >= 20) {
%&gt;
    &lt;p&gt;Hace buen tiempo&lt;/p&gt;
&lt;%
    } else {
%&gt;
    &lt;p&gt;Hace frío&lt;/p&gt;
&lt;%
    }
%&gt;
            </div>
            <%
                if (temperatura >= 20) {
            %>
                <p class="resultado">✓ Hace buen tiempo</p>
            <%
                } else {
            %>
                <p class="resultado">✗ Hace frío</p>
            <%
                }
            %>
        </div>

        <div class="ejemplo">
            <h2>3. Bucle for</h2>
            <div class="code">
&lt;%
    for (int i = 1; i &lt;= 5; i++) {
%&gt;
    &lt;p&gt;Iteración &lt;%= i %&gt;&lt;/p&gt;
&lt;%
    }
%&gt;
            </div>
            <p><strong>Resultado:</strong></p>
            <ul>
            <%
                for (int i = 1; i <= 5; i++) {
            %>
                <li>✓ Iteración <%= i %></li>
            <%
                }
            %>
            </ul>
        </div>

        <div class="ejemplo">
            <h2>4. Bucle sobre Array</h2>
            <div class="code">
&lt;%
    String[] lenguajes = {"Java", "JavaScript", "Python"};
    for (String lenguaje : lenguajes) {
%&gt;
    &lt;li&gt;&lt;%= lenguaje %&gt;&lt;/li&gt;
&lt;%
    }
%&gt;
            </div>
            <p><strong>Resultado: Lenguajes de programación</strong></p>
            <ul>
            <%
                String[] lenguajes = {"Java", "JavaScript", "Python", "SQL"};
                for (String lenguaje : lenguajes) {
            %>
                <li>🔹 <%= lenguaje %></li>
            <%
                }
            %>
            </ul>
        </div>

        <div class="ejemplo">
            <h2>5. Variables de Request (Parámetros)</h2>
            <div class="code">
&lt;%
    String nombre = request.getParameter("nombre");
    if (nombre == null) {
        nombre = "Visitante";
    }
%&gt;
            </div>
            <%
                String nombreVisitante = request.getParameter("nombre");
                if (nombreVisitante == null) {
                    nombreVisitante = "Visitante";
                }
            %>
            <p class="resultado">Bienvenido: <%= nombreVisitante %></p>
            <p><small>Prueba con: ?nombre=TuNombre</small></p>
        </div>

        <div class="ejemplo">
            <h2>6. Métodos de String</h2>
            <div class="code">
&lt;%
    String texto = "  HOLA MUNDO  ";
%&gt;
Longitud: &lt;%= texto.length() %&gt;
Sin espacios: &lt;%= texto.trim() %&gt;
Minúsculas: &lt;%= texto.toLowerCase() %&gt;
            </div>
            <%
                String texto = "  HOLA MUNDO  ";
            %>
            <p class="resultado">
                Longitud: <%= texto.length() %><br>
                Sin espacios: '<%= texto.trim() %>'<br>
                Minúsculas: '<%= texto.toLowerCase() %>'<br>
                Mayúsculas: '<%= texto.toUpperCase() %>'
            </p>
        </div>

        <hr>
        <p><strong>⚠️ Nota importante:</strong> Aunque los scriptlets son poderosos, no abuses de ellos.
        La lógica compleja debe ir en Servlets o clases Java, no en JSP.</p>
        <p><a href="index.jsp">← Volver al menú</a></p>
    </div>
</body>
</html>
