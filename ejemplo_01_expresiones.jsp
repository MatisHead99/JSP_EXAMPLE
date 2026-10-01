<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ejemplo 1: Expresiones JSP</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; max-width: 600px; }
        .ejemplo { background-color: #f0f8ff; padding: 15px; margin: 10px 0; border-left: 4px solid #2196F3; }
        .code { background-color: #e0e0e0; padding: 10px; font-family: monospace; overflow-x: auto; }
        h2 { color: #2196F3; }
        .resultado { color: #27ae60; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ejemplo 1: Expresiones JSP </h1>
        <p>Las expresiones JSP imprimen valores directamente en la página HTML.</p>

        <div class="ejemplo">
            <h2>1. Expresión Simple</h2>
            <div class="code">&lt;%= "Hola JSP" %&gt;</div>
            <p class="resultado">Resultado: <%= "Hola JSP" %></p>
        </div>

        <div class="ejemplo">
            <h2>2. Variable</h2>
            <div class="code">&lt;%= nombre %&gt;</div>
            <%
                String nombre = "Juan Carlos";
            %>
            <p class="resultado">Resultado: <%= nombre %></p>
        </div>

        <div class="ejemplo">
            <h2>3. Operación Aritmética</h2>
            <div class="code">&lt;%= 10 + 5 %&gt;</div>
            <p class="resultado">Resultado: <%= 10 + 5 %></p>
        </div>

        <div class="ejemplo">
            <h2>4. Llamada a Método</h2>
            <div class="code">&lt;%= nombre.toUpperCase() %&gt;</div>
            <p class="resultado">Resultado: <%= nombre.toUpperCase() %></p>
        </div>

        <div class="ejemplo">
            <h2>5. Objeto Date (Fecha y Hora)</h2>
            <div class="code">&lt;%= new java.util.Date() %&gt;</div>
            <p class="resultado">Resultado: <%= new java.util.Date() %></p>
        </div>

        <div class="ejemplo">
            <h2>6. Operación Ternaria</h2>
            <div class="code">&lt;%= 18 >= 18 ? "Eres mayor de edad" : "Eres menor de edad" %&gt;</div>
            <p class="resultado">Resultado: <%= 18 >= 18 ? "Eres mayor de edad" : "Eres menor de edad" %></p>
        </div>

        <hr>
        <p><strong> Recuerda:</strong> Las expresiones JSP NO pueden contener sentencias de control como if, for, while.
        Para eso usas Scriptlets &lt;% %&gt;</p>
        <p><a href="index.jsp">← Volver al menú</a></p>
    </div>
</body>
</html>
