<%-- 
    Document   : listarAutos
    Created on : 6 ene 2026, 4:00:47 p. m.
    Author     : estudiante
--%>
<%-- 
    Document   : listarAutos
    Created on : 6 ene 2026, 4:00:47 p. m.
    Author     : estudiante
--%>
<%-- 
    Document   : listarAutos
    Created on : 6 ene 2026, 4:00:47 p. m.
    Author     : estudiante
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="model.Automovil" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comparación de Map en Java</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            margin-bottom: 40px;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .header h1 {
            color: #2c3e50;
            margin-bottom: 10px;
            font-size: 2.5rem;
        }
        
        .header p {
            color: #7f8c8d;
            font-size: 1.1rem;
        }
        
        .maps-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        
        .map-card {
            flex: 1;
            min-width: 300px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }
        
        .map-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }
        
        .card-header {
            padding: 20px;
            color: white;
            text-align: center;
        }
        
        .hashmap .card-header {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        }
        
        .linkedhashmap .card-header {
            background: linear-gradient(135deg, #1dd1a1 0%, #10ac84 100%);
        }
        
        .treemap .card-header {
            background: linear-gradient(135deg, #54a0ff 0%, #2e86de 100%);
        }
        
        .card-header h3 {
            font-size: 1.5rem;
            margin-bottom: 5px;
        }
        
        .card-body {
            padding: 20px;
        }
        
        .description {
            color: #666;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
            font-size: 0.9rem;
        }
        
        .car-list {
            list-style: none;
        }
        
        .car-item {
            padding: 12px 15px;
            margin: 8px 0;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .hashmap .car-item {
            border-left-color: #ff6b6b;
        }
        
        .linkedhashmap .car-item {
            border-left-color: #1dd1a1;
        }
        
        .treemap .car-item {
            border-left-color: #54a0ff;
        }
        
        .car-info {
            font-weight: 600;
            color: #2c3e50;
        }
        
        .car-details {
            display: flex;
            gap: 10px;
        }
        
        .brand {
            background: #e74c3c;
            color: white;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
        }
        
        .color {
            background: #3498db;
            color: white;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
        }
        
        .comparison-table {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        
        th {
            background: #f8f9fa;
            padding: 12px;
            text-align: left;
            color: #2c3e50;
            border-bottom: 2px solid #eee;
        }
        
        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            color: #555;
        }
        
        tr:hover {
            background: #f8f9fa;
        }
        
        .footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .maps-container {
                flex-direction: column;
            }
            
            .map-card {
                min-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🚘 Comparación de Map en Java</h1>
            <p>Demostración práctica de HashMap, LinkedHashMap y TreeMap</p>
        </div>
        
        <div class="maps-container">
            <!-- HashMap -->
            <div class="map-card hashmap">
                <div class="card-header">
                    <h3>HashMap</h3>
                    <p>Sin orden específico</p>
                </div>
                <div class="card-body">
                    <div class="description">
                        Más rápido (O(1)), no mantiene orden de elementos.
                    </div>
                    <ul class="car-list">
                        <%
                            Map<String, Automovil> hashMap = (Map<String, Automovil>)request.getAttribute("hashMap");
                            if (hashMap != null) {
                                for (Automovil a : hashMap.values()) {
                        %>
                        <li class="car-item">
                            <span class="car-info"><%= a.getModelo() %></span>
                            <div class="car-details">
                                <span class="brand"><%= a.getFabricante() %></span>
                                <span class="color"><%= a.getColor() %></span>
                            </div>
                        </li>
                        <% 
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
            
            <!-- LinkedHashMap -->
            <div class="map-card linkedhashmap">
                <div class="card-header">
                    <h3>LinkedHashMap</h3>
                    <p>Orden de inserción</p>
                </div>
                <div class="card-body">
                    <div class="description">
                        Mantiene el orden en que se insertaron los elementos.
                    </div>
                    <ul class="car-list">
                        <%
                            Map<String, Automovil> linkedHashMap = (Map<String, Automovil>)request.getAttribute("linkedHashMap");
                            if (linkedHashMap != null) {
                                for (Automovil a : linkedHashMap.values()) {
                        %>
                        <li class="car-item">
                            <span class="car-info"><%= a.getModelo() %></span>
                            <div class="car-details">
                                <span class="brand"><%= a.getFabricante() %></span>
                                <span class="color"><%= a.getColor() %></span>
                            </div>
                        </li>
                        <% 
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
            
            <!-- TreeMap -->
            <div class="map-card treemap">
                <div class="card-header">
                    <h3>TreeMap</h3>
                    <p>Orden natural</p>
                </div>
                <div class="card-body">
                    <div class="description">
                        Ordena automáticamente las claves de forma ascendente.
                    </div>
                    <ul class="car-list">
                        <%
                            Map<String, Automovil> treeMap = (Map<String, Automovil>)request.getAttribute("treeMap");
                            if (treeMap != null) {
                                for (Automovil a : treeMap.values()) {
                        %>
                        <li class="car-item">
                            <span class="car-info"><%= a.getModelo() %></span>
                            <div class="car-details">
                                <span class="brand"><%= a.getFabricante() %></span>
                                <span class="color"><%= a.getColor() %></span>
                            </div>
                        </li>
                        <% 
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="comparison-table">
            <h3>📋 Comparación Técnica</h3>
            <table>
                <thead>
                    <tr>
                        <th>Característica</th>
                        <th>HashMap</th>
                        <th>LinkedHashMap</th>
                        <th>TreeMap</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>Orden</strong></td>
                        <td>No garantizado</td>
                        <td>Inserción</td>
                        <td>Natural/Comparador</td>
                    </tr>
                    <tr>
                        <td><strong>Rendimiento</strong></td>
                        <td>O(1)</td>
                        <td>O(1)</td>
                        <td>O(log n)</td>
                    </tr>
                    <tr>
                        <td><strong>Memoria</strong></td>
                        <td>Baja</td>
                        <td>Media</td>
                        <td>Alta</td>
                    </tr>
                    <tr>
                        <td><strong>Claves nulas</strong></td>
                        <td>Permitidas</td>
                        <td>Permitidas</td>
                        <td>No permitidas*</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="footer">
            <p>Programación Orientada a Objetos • JSP + Maps • 
               Total de autos: 
               <%
                    int total = 0;
                    if (hashMap != null) total += hashMap.size();
                    if (linkedHashMap != null) total += linkedHashMap.size();
                    if (treeMap != null) total += treeMap.size();
                    out.print(total);
               %>
            </p>
            <p>Nota: TreeMap ordena alfabéticamente por modelo (clave)</p>
        </div>
    </div>
</body>
</html>