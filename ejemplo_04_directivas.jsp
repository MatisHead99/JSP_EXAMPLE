<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page errorPage="error.jsp" %>

<%!
    public class Producto {
        private String nombre;
        private double precio;

        public Producto(String nombre, double precio) {
            this.nombre = nombre;
            this.precio = precio;
        }

        public String getNombre() { return nombre; }
        public double getPrecio() { return precio; }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ejemplo 4: Directivas de JSP</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; max-width: 800px; }
        .ejemplo { background-color: #e3f2fd; padding: 15px; margin: 10px 0; border-left: 4px solid #2196F3; }
        .code { background-color: #e0e0e0; padding: 10px; font-family: monospace; overflow-x: auto; font-size: 11px; }
        h2 { color: #2196F3; }
        .resultado { color: #1565c0; font-weight: bold; background-color: #e3f2fd; padding: 10px; border-radius: 4px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        td, th { padding: 10px; border: 1px solid #bbb; text-align: left; }
        th { background-color: #2196F3; color: white; }
        .directiva { background-color: #fff3e0; padding: 8px; font-family: monospace; margin: 5px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ejemplo 4: Directivas de JSP &lt;%@ %&gt;</h1>
        <p>Las directivas instruyen al servidor cómo compilar la página JSP.</p>

        <div class="ejemplo">
            <h2>1. Directiva page - Configuración Básica</h2>
            <div class="directiva">&lt;%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %&gt;</div>
            <p><strong>Atributos:</strong></p>
            <ul>
                <li><code>language="java"</code> - Lenguaje de programación (siempre java)</li>
                <li><code>contentType="text/html; charset=UTF-8"</code> - Tipo MIME y codificación</li>
                <li><code>pageEncoding="UTF-8"</code> - Codificación del archivo JSP</li>
            </ul>
            <p class="resultado">✓ Esta página está configurada con UTF-8 para soportar caracteres especiales</p>
        </div>

        <div class="ejemplo">
            <h2>2. Directiva page - Import (Importar Clases)</h2>
            <div class="directiva">
&lt;%@ page import="java.util.ArrayList" %&gt;<br>
&lt;%@ page import="java.util.List" %&gt;<br>
&lt;%@ page import="java.text.DecimalFormat" %&gt;
            </div>
            <p><strong>¿Por qué?</strong> Sin imports, tendrías que usar el nombre completo: <code>java.util.ArrayList</code></p>
            <%
                List<String> ciudades = new ArrayList<>();
                ciudades.add("Bogotá");
                ciudades.add("Medellín");
                ciudades.add("Cali");
                ciudades.add("Barranquilla");
            %>
            <p class="resultado">Gracias al import, puedo usar <code>ArrayList</code> directamente:</p>
            <ul>
            <%
                for (String ciudad : ciudades) {
            %>
                <li><%= ciudad %></li>
            <%
                }
            %>
            </ul>
        </div>

        <div class="ejemplo">
            <h2>3. Directiva page - errorPage</h2>
            <div class="directiva">&lt;%@ page errorPage="error.jsp" %&gt;</div>
            <p><strong>¿Qué hace?</strong> Si ocurre una excepción, redirige a la página de error especificada.</p>
            <p>En esta página, si hay un error, se mostraría el contenido de <code>error.jsp</code></p>
            <%
                // Ejemplo: si descomenta la siguiente línea, vería la página de error
                // int x = 1 / 0; // Esto causaría excepción
            %>
            <p class="resultado">Manejo de errores configurado. Intenta con un parámetro inválido.</p>
        </div>

        <div class="ejemplo">
            <h2>4. Importar Clases Personalizadas</h2>
            <div class="directiva">&lt;%@ page import="java.text.DecimalFormat" %&gt;</div>
            <p><strong>Usando DecimalFormat importado:</strong></p>
            <%
                DecimalFormat df = new DecimalFormat("$#,##0.00");
                double[] precios = {199.99, 1500.50, 25000.00};
            %>
            <table>
                <tr>
                    <th>Artículo</th>
                    <th>Precio Original</th>
                    <th>Precio Formateado</th>
                </tr>
                <%
                    String[] articulos = {"Laptop", "Mouse", "Monitor"};
                    for (int i = 0; i < articulos.length; i++) {
                %>
                <tr>
                    <td><%= articulos[i] %></td>
                    <td><%= precios[i] %></td>
                    <td class="resultado"><%= df.format(precios[i]) %></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

        <div class="ejemplo">
            <h2>5. Múltiples Directivas page</h2>
            <div class="directiva">
&lt;%@ page language="java" %&gt;<br>
&lt;%@ page contentType="text/html; charset=UTF-8" %&gt;<br>
&lt;%@ page import="java.util.*" %&gt;
            </div>
            <p><strong>O combinadas en una:</strong></p>
            <div class="directiva">
&lt;%@ page<br>
&nbsp;&nbsp;&nbsp;&nbsp;language="java"<br>
&nbsp;&nbsp;&nbsp;&nbsp;contentType="text/html; charset=UTF-8"<br>
&nbsp;&nbsp;&nbsp;&nbsp;pageEncoding="UTF-8"<br>
&nbsp;&nbsp;&nbsp;&nbsp;import="java.util.*"<br>
%&gt;
            </div>
            <p class="resultado">✓ Ambas formas funcionan igual</p>
        </div>

        <div class="ejemplo">
            <h2>6. Usar Clase Definida en Declaración</h2>
            <p><strong>Definimos la clase Producto en una declaración:</strong></p>
            <div class="code">
&lt;%!
    public class Producto {
        private String nombre;
        private double precio;

        public Producto(String nombre, double precio) {
            this.nombre = nombre;
            this.precio = precio;
        }

        public String getNombre() { return nombre; }
        public double getPrecio() { return precio; }
    }
%&gt;
            </div>
            <%
                List<Producto> productos = new ArrayList<>();
                productos.add(new Producto("Teclado", 85.50));
                productos.add(new Producto("Pantalla", 350.00));
                productos.add(new Producto("Webcam", 120.99));
            %>
            <p><strong>Resultado: Catálogo de Productos</strong></p>
            <table>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
                <%
                    for (Producto p : productos) {
                %>
                <tr>
                    <td><%= p.getNombre() %></td>
                    <td><%= "$" + p.getPrecio() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

        <hr>
        <h3>Resumen de Directivas Principales</h3>
        <table>
            <tr>
                <th>Directiva</th>
                <th>Uso</th>
                <th>Ejemplo</th>
            </tr>
            <tr>
                <td><code>@page</code></td>
                <td>Configurar la página</td>
                <td>&lt;%@ page language="java" contentType="text/html" %&gt;</td>
            </tr>
            <tr>
                <td><code>@page import</code></td>
                <td>Importar clases Java</td>
                <td>&lt;%@ page import="java.util.*" %&gt;</td>
            </tr>
            <tr>
                <td><code>@include</code></td>
                <td>Incluir archivo (compilación)</td>
                <td>&lt;%@ include file="header.jsp" %&gt;</td>
            </tr>
            <tr>
                <td><code>@taglib</code></td>
                <td>Usar librerías de tags</td>
                <td>&lt;%@ taglib uri="..." prefix="c" %&gt;</td>
            </tr>
        </table>

        <hr>
        <p><strong>ℹ️ Nota:</strong> Las directivas se procesan en <strong>tiempo de compilación</strong>,
        no en tiempo de ejecución. Esto significa que cualquier error en una directiva impide que la página se compile.</p>
        <p><a href="index.jsp">← Volver al menú</a></p>
    </div>
</body>
</html>
