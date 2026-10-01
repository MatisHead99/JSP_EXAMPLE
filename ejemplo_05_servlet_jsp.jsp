<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ejemplo 5: Integración Servlet + JSP</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { background-color: white; padding: 20px; border-radius: 8px; max-width: 900px; }
        .arquitectura {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin: 20px 0;
            gap: 10px;
        }
        .capa {
            flex: 1;
            background-color: #f0f0f0;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            border: 2px solid #2196F3;
        }
        .capa h3 { color: #2196F3; margin-top: 0; }
        .codigo { background-color: #f5f5f5; padding: 15px; margin: 10px 0; border-left: 4px solid #2196F3; }
        .code-block { background-color: #e0e0e0; padding: 10px; font-family: monospace; overflow-x: auto; font-size: 12px; }
        .flujo {
            text-align: center;
            margin: 20px 0;
            padding: 20px;
            background-color: #fff3e0;
            border-radius: 8px;
            border-left: 4px solid #ffc107;
        }
        .paso {
            display: inline-block;
            background-color: #ffc107;
            color: white;
            padding: 10px 15px;
            margin: 5px;
            border-radius: 20px;
            font-weight: bold;
        }
        .flecha { font-size: 24px; margin: 0 10px; }
        h2 { color: #2196F3; }
        .ventajas { background-color: #c8e6c9; padding: 15px; border-radius: 8px; margin: 10px 0; }
        .codigo-java { background-color: #e8eaf6; padding: 15px; margin: 10px 0; border-left: 4px solid #3f51b5; }
        li { margin: 8px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ejemplo 5: Separación de Capas - Servlet + JSP (Arquitectura MVC)</h1>

        <div class="flujo">
            <h3>Flujo Típico de una Solicitud</h3>
            <div>
                <span class="paso">1. Cliente</span>
                <span class="flecha">→</span>
                <span class="paso">2. Servlet</span>
                <span class="flecha">→</span>
                <span class="paso">3. Lógica/BD</span>
                <span class="flecha">→</span>
                <span class="paso">4. JSP</span>
                <span class="flecha">→</span>
                <span class="paso">5. HTML</span>
            </div>
        </div>

        <div class="arquitectura">
            <div class="capa">
                <h3>Servlet<br><small>(Controlador)</small></h3>
                <p>Recibe solicitud</p>
                <p>Procesa lógica</p>
                <p>Prepara datos</p>
                <p>Delega a JSP</p>
            </div>
            <div style="font-size: 30px; color: #2196F3;">→</div>
            <div class="capa">
                <h3>JSP<br><small>(Vista)</small></h3>
                <p>Recibe datos</p>
                <p>Genera HTML</p>
                <p>Muestra resultado</p>
            </div>
        </div>

        <h2>❌ ANTI-PATRÓN: Toda la lógica en JSP</h2>
        <div class="codigo-java">
            <p><strong>¿Por qué es malo?</strong></p>
            <ul>
                <li>Código difícil de leer y mantener</li>
                <li>No se puede testear automáticamente</li>
                <li>Mezcla presentación con lógica de negocio</li>
                <li>Reutilización de lógica es complicada</li>
            </ul>
            <div class="code-block">
&lt;%
  // ❌ EVITA ESTO EN JSP
  String nombre = request.getParameter("nombre");
  String email = request.getParameter("email");

  // Validar
  if (nombre.isEmpty()) {
    out.println("Error: nombre vacío");
    return;
  }

  // Conectar a BD
  Connection conn = DriverManager.getConnection("jdbc:mysql://...");
  PreparedStatement ps = conn.prepareStatement("INSERT INTO usuarios ...");
  ps.setString(1, nombre);
  ps.setString(2, email);
  ps.executeUpdate();
  ps.close();
  conn.close();

  out.println("Usuario registrado");
%&gt;
            </div>
        </div>

        <h2>✅ MEJOR PRÁCTICA: Separación de Capas</h2>

        <h3>1. Servlet (Controlador) - RegistroServlet.java</h3>
        <div class="codigo">
            <div class="code-block">
@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                    throws ServletException, IOException {

        // Recibir parámetros
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");

        // Validar
        if (nombre == null || nombre.isEmpty()) {
            request.setAttribute("error", "Nombre es obligatorio");
            request.getRequestDispatcher("formulario.jsp")
                   .forward(request, response);
            return;
        }

        if (email == null || !email.contains("@")) {
            request.setAttribute("error", "Email inválido");
            request.getRequestDispatcher("formulario.jsp")
                   .forward(request, response);
            return;
        }

        // Procesar - Crear objeto
        Usuario usuario = new Usuario(nombre, email);

        // Guardar en BD
        usuarioDAO.guardar(usuario);

        // Pasar datos a JSP
        request.setAttribute("usuario", usuario);

        // Delegar a JSP para mostrar
        request.getRequestDispatcher("confirmacion.jsp")
               .forward(request, response);
    }
}
            </div>
        </div>

        <h3>2. JSP (Vista) - confirmacion.jsp</h3>
        <div class="codigo">
            <div class="code-block">
&lt;%@ page contentType="text/html; charset=UTF-8" %&gt;
&lt;%@ page import="com.ejemplo.Usuario" %&gt;

&lt;%
    // Recuperar datos preparados por el Servlet
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%&gt;

&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
    &lt;title&gt;Confirmación&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;h1&gt;¡Bienvenido!&lt;/h1&gt;
    &lt;p&gt;Nombre: &lt;%= usuario.getNombre() %&gt;&lt;/p&gt;
    &lt;p&gt;Email: &lt;%= usuario.getEmail() %&gt;&lt;/p&gt;
    &lt;a href="index.jsp"&gt;Ir al inicio&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
            </div>
        </div>

        <h3>3. Modelo (Lógica de Negocio) - Usuario.java</h3>
        <div class="codigo">
            <div class="code-block">
public class Usuario {
    private String nombre;
    private String email;
    private Date fechaCreacion;

    public Usuario(String nombre, String email) {
        this.nombre = nombre;
        this.email = email;
        this.fechaCreacion = new Date();
    }

    public String getNombre() { return nombre; }
    public String getEmail() { return email; }
    public Date getFechaCreacion() { return fechaCreacion; }
}
            </div>
        </div>

        <div class="ventajas">
            <h3>✅ Ventajas de esta Arquitectura</h3>
            <ul>
                <li><strong>Separación de responsabilidades:</strong> Cada capa hace una cosa bien</li>
                <li><strong>Fácil de testear:</strong> Puedes testear lógica sin JSP</li>
                <li><strong>Código limpio:</strong> JSP solo tiene presentación (< 20 líneas de Java)</li>
                <li><strong>Reutilizable:</strong> El Servlet puede servir múltiples vistas</li>
                <li><strong>Mantenible:</strong> Cambios en lógica no afectan presentación</li>
                <li><strong>Escalable:</strong> Fácil agregar nuevas funciones</li>
            </ul>
        </div>

        <h2>Comparación de Enfoques</h2>
        <table style="width: 100%; border-collapse: collapse; margin: 20px 0;">
            <tr style="background-color: #2196F3; color: white;">
                <th style="padding: 10px; border: 1px solid #999;">Aspecto</th>
                <th style="padding: 10px; border: 1px solid #999;">Servlet Solo</th>
                <th style="padding: 10px; border: 1px solid #999;">JSP Solo</th>
                <th style="padding: 10px; border: 1px solid #999;">Servlet + JSP ✅</th>
            </tr>
            <tr style="background-color: #f5f5f5;">
                <td style="padding: 10px; border: 1px solid #999;"><strong>Lógica</strong></td>
                <td style="padding: 10px; border: 1px solid #999;">En Java (verbose)</td>
                <td style="padding: 10px; border: 1px solid #999;">Mezclada (confuso)</td>
                <td style="padding: 10px; border: 1px solid #999;">En Servlet (limpio)</td>
            </tr>
            <tr>
                <td style="padding: 10px; border: 1px solid #999;"><strong>Presentación</strong></td>
                <td style="padding: 10px; border: 1px solid #999;">out.println() (tedioso)</td>
                <td style="padding: 10px; border: 1px solid #999;">HTML natural</td>
                <td style="padding: 10px; border: 1px solid #999;">HTML natural ✅</td>
            </tr>
            <tr style="background-color: #f5f5f5;">
                <td style="padding: 10px; border: 1px solid #999;"><strong>Mantenimiento</strong></td>
                <td style="padding: 10px; border: 1px solid #999;">Difícil</td>
                <td style="padding: 10px; border: 1px solid #999;">Muy difícil</td>
                <td style="padding: 10px; border: 1px solid #999;">Fácil ✅</td>
            </tr>
            <tr>
                <td style="padding: 10px; border: 1px solid #999;"><strong>Testing</strong></td>
                <td style="padding: 10px; border: 1px solid #999;">Posible</td>
                <td style="padding: 10px; border: 1px solid #999;">Difícil</td>
                <td style="padding: 10px; border: 1px solid #999;">Fácil ✅</td>
            </tr>
            <tr style="background-color: #f5f5f5;">
                <td style="padding: 10px; border: 1px solid #999;"><strong>Recomendación</strong></td>
                <td style="padding: 10px; border: 1px solid #999;">❌ No usar</td>
                <td style="padding: 10px; border: 1px solid #999;">❌ Evitar</td>
                <td style="padding: 10px; border: 1px solid #999;">✅ USAR SIEMPRE</td>
            </tr>
        </table>

        <hr>
        <p><strong>🎯 Regla de Oro:</strong>
        En la arquitectura MVC, los Servlets actúan como Controladores (C),
        las clases Java como Modelos (M), y JSP como Vistas (V).</p>
        <p><a href="index.jsp">← Volver al menú</a></p>
    </div>
</body>
</html>
