<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semana 9: Java Server Pages (JSP) - Ejemplos Prácticos</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 20px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1.1em;
            opacity: 0.9;
        }

        .content {
            padding: 40px;
        }

        .section {
            margin-bottom: 40px;
        }

        .section h2 {
            color: #667eea;
            font-size: 1.8em;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #667eea;
        }

        .ejemplos-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .ejemplo-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 8px;
            padding: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            border-left: 5px solid #667eea;
        }

        .ejemplo-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .ejemplo-card h3 {
            color: #667eea;
            margin-bottom: 10px;
            font-size: 1.3em;
        }

        .ejemplo-card p {
            color: #555;
            line-height: 1.6;
            margin-bottom: 15px;
            font-size: 0.95em;
        }

        .btn {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: opacity 0.3s;
            border: none;
            cursor: pointer;
            font-size: 0.95em;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .teoria-card {
            background-color: #f0f8ff;
            border-left: 5px solid #2196F3;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .teoria-card h3 {
            color: #2196F3;
            margin-bottom: 10px;
        }

        .teoria-card ul {
            margin-left: 20px;
            color: #555;
            line-height: 1.8;
        }

        .recursos {
            background: linear-gradient(135deg, #fff5e6 0%, #ffe6cc 100%);
            padding: 20px;
            border-radius: 8px;
            border-left: 5px solid #ffc107;
        }

        .recursos h3 {
            color: #ff8c00;
            margin-bottom: 15px;
        }

        .recursos li {
            margin-bottom: 8px;
            color: #555;
        }

        .footer {
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
            color: #777;
            border-top: 1px solid #ddd;
        }

        .badge {
            display: inline-block;
            background-color: #667eea;
            color: white;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 0.8em;
            margin-right: 5px;
        }

        .badge-expresion { background-color: #4caf50; }
        .badge-scriptlet { background-color: #2196F3; }
        .badge-declaracion { background-color: #ff9800; }
        .badge-directiva { background-color: #e91e63; }
        .badge-arquitectura { background-color: #9c27b0; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🌐 Semana 9: Java Server Pages (JSP)</h1>
            <p>Ejemplos prácticos y ejercicios de la tecnología JSP para desarrollo web en Java</p>
        </div>

        <div class="content">
            <!-- Sección Documentación -->
            <div class="section">
                <h2>📚 Documentación Oficial</h2>
                <p>Antes de comenzar con los ejemplos, lee la documentación disponible en la carpeta Semana 9:</p>
                <div class="ejemplos-grid">
                    <div class="teoria-card">
                        <h3>📖 Guía Docente (Guia_Docente_Semana9_JSP.md)</h3>
                        <p>Explicación completa de todos los temas JSP con:</p>
                        <ul>
                            <li>Conceptos fundamentales</li>
                            <li>Tipos de elementos JSP</li>
                            <li>Directivas y pseudo-tags</li>
                            <li>Arquitectura MVC con Servlet + JSP</li>
                            <li>Errores comunes y buenas prácticas</li>
                            <li>Ejercicios incrementales</li>
                        </ul>
                    </div>

                    <div class="teoria-card">
                        <h3>✍️ Preparación Previa (Preparacion_Previa_Semana9_JSP.md)</h3>
                        <p>Guía para estudiantes con:</p>
                        <ul>
                            <li>Preguntas de consulta previa</li>
                            <li>Respuestas detalladas</li>
                            <li>Resumen de conceptos</li>
                            <li>Checklist de preparación</li>
                            <li>Reflexiones para clase</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Sección Ejemplos Prácticos -->
            <div class="section">
                <h2>💻 Ejemplos Prácticos Ejecutables</h2>
                <p>Haz clic en cada ejemplo para verlo en acción. Cada uno está completamente funcional y
                anotado para entender el código.</p>

                <div class="ejemplos-grid">
                    <!-- Ejemplo 1 -->
                    <div class="ejemplo-card">
                        <span class="badge badge-expresion">Expresión</span>
                        <h3>1️⃣ Expresiones JSP &lt;%= %&gt;</h3>
                        <p>Aprende a imprimir valores simples, variables, operaciones y resultados de métodos
                        directamente en la página.</p>
                        <p><strong>Tema:</strong> Cómo usar expresiones para mostrar datos dinámicos.</p>
                        <a href="ejemplo_01_expresiones.jsp" class="btn">Ver Ejemplo →</a>
                    </div>

                    <!-- Ejemplo 2 -->
                    <div class="ejemplo-card">
                        <span class="badge badge-scriptlet">Scriptlet</span>
                        <h3>2️⃣ Scriptlets &lt;% %&gt;</h3>
                        <p>Escribe lógica Java compleja: bucles, condicionales, manejo de arrays y variables.</p>
                        <p><strong>Tema:</strong> Cómo integrar código Java en presentación (con advertencias).</p>
                        <a href="ejemplo_02_scriptlets.jsp" class="btn">Ver Ejemplo →</a>
                    </div>

                    <!-- Ejemplo 3 -->
                    <div class="ejemplo-card">
                        <span class="badge badge-declaracion">Declaración</span>
                        <h3>3️⃣ Declaraciones &lt;%! %&gt;</h3>
                        <p>Define métodos reutilizables y variables de instancia que pertenecen a la clase JSP.</p>
                        <p><strong>Tema:</strong> Cómo crear funciones propias y contadores persistentes.</p>
                        <a href="ejemplo_03_declaraciones.jsp" class="btn">Ver Ejemplo →</a>
                    </div>

                    <!-- Ejemplo 4 -->
                    <div class="ejemplo-card">
                        <span class="badge badge-directiva">Directiva</span>
                        <h3>4️⃣ Directivas &lt;%@ %&gt;</h3>
                        <p>Configura la página, importa clases, define manejo de errores. Directiva page,
                        include, taglib.</p>
                        <p><strong>Tema:</strong> Cómo preparar el ambiente de compilación.</p>
                        <a href="ejemplo_04_directivas.jsp" class="btn">Ver Ejemplo →</a>
                    </div>

                    <!-- Ejemplo 5 -->
                    <div class="ejemplo-card">
                        <span class="badge badge-arquitectura">Arquitectura MVC</span>
                        <h3>5️⃣ Servlet + JSP (Arquitectura MVC)</h3>
                        <p>Implementa la separación correcta: Servlet como controlador, JSP como vista.
                        La forma profesional de hacerlo.</p>
                        <p><strong>Tema:</strong> Mejores prácticas de separación de capas.</p>
                        <a href="ejemplo_05_servlet_jsp.jsp" class="btn">Ver Ejemplo →</a>
                    </div>
                </div>
            </div>

            <!-- Sección Resumen de Conceptos -->
            <div class="section">
                <h2>📋 Resumen de Conceptos Clave</h2>

                <div class="teoria-card">
                    <h3>Elementos JSP</h3>
                    <ul>
                        <li><strong>&lt;%= ... %&gt;</strong> - Expresión: Imprime un valor simple</li>
                        <li><strong>&lt;% ... %&gt;</strong> - Scriptlet: Código Java completo</li>
                        <li><strong>&lt;%! ... %&gt;</strong> - Declaración: Métodos y variables de clase</li>
                        <li><strong>&lt;%@ ... %&gt;</strong> - Directiva: Configuración de página</li>
                        <li><strong>&lt;%-- ... --%&gt;</strong> - Comentario: Solo para servidor</li>
                    </ul>
                </div>

                <div class="teoria-card">
                    <h3>Directivas Principales</h3>
                    <ul>
                        <li><strong>@page</strong> - Configura charset, contenido, importaciones: <code>&lt;%@ page language="java" contentType="text/html; charset=UTF-8" %&gt;</code></li>
                        <li><strong>@page import</strong> - Importa clases Java: <code>&lt;%@ page import="java.util.*" %&gt;</code></li>
                        <li><strong>@include</strong> - Incluye archivo al compilar: <code>&lt;%@ include file="header.jsp" %&gt;</code></li>
                        <li><strong>@taglib</strong> - Usa librerías de tags: <code>&lt;%@ taglib uri="..." prefix="c" %&gt;</code></li>
                    </ul>
                </div>

                <div class="teoria-card">
                    <h3>Pseudo-Tags Comunes</h3>
                    <ul>
                        <li><strong>&lt;jsp:include&gt;</strong> - Incluye fragmento en tiempo de ejecución</li>
                        <li><strong>&lt;jsp:forward&gt;</strong> - Redirige a otra página</li>
                        <li><strong>&lt;jsp:useBean&gt;</strong> - Instancia un objeto automáticamente</li>
                    </ul>
                </div>

                <div class="teoria-card">
                    <h3>Buenas Prácticas</h3>
                    <ul>
                        <li>✅ Separar lógica (Servlet) de presentación (JSP)</li>
                        <li>✅ Usar expresiones para valores simples</li>
                        <li>✅ Mantener JSP con máximo 20 líneas de código Java</li>
                        <li>✅ Importar clases necesarias en directiva @page</li>
                        <li>✅ Siempre usar UTF-8 para encoding</li>
                        <li>❌ Evitar lógica compleja en JSP</li>
                        <li>❌ No mezclar validación de datos con presentación</li>
                    </ul>
                </div>
            </div>

            <!-- Sección Recursos -->
            <div class="section recursos">
                <h3>📖 Recursos y Referencias</h3>
                <ul>
                    <li><strong>Documentación oficial:</strong> <a href="https://jakarta.ee/specifications/pages/" style="color: #ff8c00;" target="_blank">Jakarta Server Pages</a></li>
                    <li><strong>Apache Tomcat:</strong> <a href="https://tomcat.apache.org/" style="color: #ff8c00;" target="_blank">https://tomcat.apache.org/</a></li>
                    <li><strong>Referencia rápida:</strong> Revisa la carpeta Semana 9 en el repositorio del curso</li>
                    <li><strong>Siguiente tema (Semana 10):</strong> Objetos implícitos (request, response, out, session, application)</li>
                </ul>
            </div>

            <!-- Sección Pasos para Ejecutar -->
            <div class="section">
                <h2>🚀 Pasos para Ejecutar los Ejemplos</h2>
                <div class="teoria-card">
                    <h3>Requisitos</h3>
                    <ul>
                        <li>Apache Tomcat 9+ instalado</li>
                        <li>JDK 11+ configurado</li>
                        <li>Carpeta de la aplicación en <code>$TOMCAT_HOME/webapps/</code></li>
                    </ul>
                </div>
                <div class="teoria-card">
                    <h3>Instrucciones</h3>
                    <ol style="margin-left: 20px; line-height: 1.8;">
                        <li>Copia la carpeta del proyecto a webapps (o crea un context)</li>
                        <li>Inicia Tomcat: <code>catalina.sh start</code> (Linux/Mac) o <code>catalina.bat start</code> (Windows)</li>
                        <li>Abre en navegador: <code>http://localhost:8080/Programacion3/Semana9/index.jsp</code></li>
                        <li>Haz clic en cada ejemplo para verlo en acción</li>
                        <li>Abre DevTools (F12) → Consola para ver mensajes de depuración</li>
                        <li>Ve a <code>/work/Catalina/localhost/</code> para ver el código Java compilado</li>
                    </ol>
                </div>
            </div>

            <!-- Sección Ejercicios -->
            <div class="section">
                <h2>✏️ Ejercicios Propuestos</h2>
                <div class="teoria-card">
                    <h3>Ejercicio 1: Lista Dinámica (Nivel: Fácil)</h3>
                    <p>Crea un archivo <code>ejercicio_lista.jsp</code> que:</p>
                    <ul>
                        <li>Declare un array de 5 productos</li>
                        <li>Use un scriptlet para iterar sobre el array</li>
                        <li>Genere una tabla HTML con nombre y precio</li>
                    </ul>
                </div>

                <div class="teoria-card">
                    <h3>Ejercicio 2: Validación de Formulario (Nivel: Medio)</h3>
                    <p>Crea <code>ejercicio_formulario.jsp</code> que:</p>
                    <ul>
                        <li>Muestre un formulario HTML</li>
                        <li>Reciba nombre, email y edad via request</li>
                        <li>Valide que no estén vacíos</li>
                        <li>Muestre un mensaje de bienvenida o error según corresponda</li>
                    </ul>
                </div>

                <div class="teoria-card">
                    <h3>Ejercicio 3: Separación MVC (Nivel: Avanzado)</h3>
                    <p>Crea un Servlet + JSP que:</p>
                    <ul>
                        <li>Servlet reciba datos de un formulario</li>
                        <li>Valide y procese en el Servlet</li>
                        <li>Pase datos a JSP via request.setAttribute()</li>
                        <li>JSP solo presente los datos sin lógica</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>Semana 9 - Programación III | ETITC - Tecnología en Desarrollo de Software</p>
            <p>Última actualización: 2026-09-29</p>
        </div>
    </div>
</body>
</html>
