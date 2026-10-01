<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%!
    // Declaración de métodos reutilizables
    public String saludar(String nombre) {
        return "¡Hola, " + nombre + "!";
    }

    public int calcularPromedio(int[] calificaciones) {
        if (calificaciones == null || calificaciones.length == 0) return 0;
        int suma = 0;
        for (int cal : calificaciones) {
            suma += cal;
        }
        return suma / calificaciones.length;
    }

    public String formatearFecha(Date fecha) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return sdf.format(fecha);
    }

    public boolean esEmailValido(String email) {
        return email != null && email.contains("@") && email.contains(".");
    }

    public String generarLista(String[] items) {
        if (items == null) return "";
        StringBuilder html = new StringBuilder("<ul>");
        for (String item : items) {
            html.append("<li>").append(item).append("</li>");
        }
        html.append("</ul>");
        return html.toString();
    }

    // Variable de instancia (contador compartido entre peticiones)
    private int contadorVisitas = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ejemplo 3: Declaraciones JSP</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; max-width: 700px; margin: 0 auto; }
        .ejemplo { background-color: #e8f5e9; padding: 15px; margin: 10px 0; border-left: 4px solid #4caf50; }
        .code { background-color: #e0e0e0; padding: 10px; font-family: monospace; overflow-x: auto; font-size: 12px; }
        h2 { color: #4caf50; margin-top: 0; }
        .resultado { color: #27ae60; font-weight: bold; background-color: #f1f8f6; padding: 10px; border-radius: 4px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        td { padding: 8px; border: 1px solid #ddd; }
        th { background-color: #4caf50; color: white; padding: 8px; text-align: left; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ejemplo 3: Declaraciones JSP &lt;%! %&gt;</h1>
        <p>Las declaraciones permiten definir métodos y variables que pertenecen a la clase JSP compilada.</p>

        <div class="ejemplo">
            <h2>1. Método Reutilizable Simple</h2>
            <div class="code">
&lt;%!
    public String saludar(String nombre) {
        return "¡Hola, " + nombre + "!";
    }
%&gt;

Resultado: &lt;%= saludar("María") %&gt;
            </div>
            <p class="resultado">Resultado: <%= saludar("María") %></p>
            <p class="resultado">Resultado: <%= saludar("Carlos") %></p>
        </div>

        <div class="ejemplo">
            <h2>2. Método con Parámetro Array</h2>
            <div class="code">
&lt;%!
    public int calcularPromedio(int[] calificaciones) {
        int suma = 0;
        for (int cal : calificaciones) {
            suma += cal;
        }
        return suma / calificaciones.length;
    }
%&gt;

Calificaciones: 85, 90, 78, 92
Promedio: &lt;%= calcularPromedio(new int[]{85, 90, 78, 92}) %&gt;
            </div>
            <%
                int promedio = calcularPromedio(new int[]{85, 90, 78, 92});
            %>
            <p class="resultado">Calificaciones: 85, 90, 78, 92</p>
            <p class="resultado">Promedio: <%= promedio %></p>
        </div>

        <div class="ejemplo">
            <h2>3. Formateo de Fecha</h2>
            <div class="code">
&lt;%!
    public String formatearFecha(Date fecha) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return sdf.format(fecha);
    }
%&gt;

Ahora: &lt;%= formatearFecha(new Date()) %&gt;
            </div>
            <%
                Date ahora = new Date();
            %>
            <p class="resultado">Ahora: <%= formatearFecha(ahora) %></p>
        </div>

        <div class="ejemplo">
            <h2>4. Variable de Instancia (Contador)</h2>
            <div class="code">
&lt;%!
    private int contadorVisitas = 0;
%&gt;

Cada vez que se recarga, incrementa:
&lt;%= ++contadorVisitas %&gt;
            </div>
            <%
                contadorVisitas++;
            %>
            <p class="resultado">🔹 Esta página ha sido recargada <%= contadorVisitas %> veces</p>
            <p><small>(Nota: El contador se reinicia si reinicia el servidor)</small></p>
        </div>

        <div class="ejemplo">
            <h2>5. Validación de Email</h2>
            <div class="code">
&lt;%!
    public boolean esEmailValido(String email) {
        return email != null &amp;&amp; email.contains("@") &amp;&amp; email.contains(".");
    }
%&gt;
            </div>
            <table>
                <tr>
                    <th>Email</th>
                    <th>¿Válido?</th>
                </tr>
                <%
                    String[] emails = {"juan@gmail.com", "maria@empresa.co", "usuario_invalido", "admin@site.org"};
                    for (String email : emails) {
                %>
                <tr>
                    <td><%= email %></td>
                    <td><%= esEmailValido(email) ? "✓ Sí" : "✗ No" %></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

        <div class="ejemplo">
            <h2>6. Método que Genera HTML</h2>
            <div class="code">
&lt;%!
    public String generarLista(String[] items) {
        StringBuilder html = new StringBuilder("&lt;ul&gt;");
        for (String item : items) {
            html.append("&lt;li&gt;").append(item).append("&lt;/li&gt;");
        }
        html.append("&lt;/ul&gt;");
        return html.toString();
    }
%&gt;
            </div>
            <%
                String[] frutas = {"Manzana", "Banano", "Naranja", "Fresa"};
            %>
            <p><strong>Frutas disponibles:</strong></p>
            <%= generarLista(frutas) %>
        </div>

        <hr>
        <h3>Comparación: Declaración vs Scriptlet</h3>
        <table>
            <tr>
                <th>Aspecto</th>
                <th>Declaración &lt;%! %&gt;</th>
                <th>Scriptlet &lt;% %&gt;</th>
            </tr>
            <tr>
                <td><strong>Uso</strong></td>
                <td>Métodos y variables de clase</td>
                <td>Lógica de página</td>
            </tr>
            <tr>
                <td><strong>Reutilización</strong></td>
                <td>Sí, en toda la página</td>
                <td>Solo en esa página</td>
            </tr>
            <tr>
                <td><strong>Alcance</strong></td>
                <td>De clase (permanente)</td>
                <td>De servicio (por solicitud)</td>
            </tr>
            <tr>
                <td><strong>Ejemplo</strong></td>
                <td>&lt;%! public void metodo() {} %&gt;</td>
                <td>&lt;% int x = 5; %&gt;</td>
            </tr>
        </table>

        <hr>
        <p><strong> Recuerda:</strong> Las declaraciones definen la estructura de la clase JSP compilada.
        Usa métodos aquí para código reutilizable y variables para estado compartido.</p>
        <p><a href="index.jsp">← Volver al menú</a></p>
    </div>
</body>
</html>