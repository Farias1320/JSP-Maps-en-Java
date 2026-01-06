/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import service.AutomovilService;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/listarAutos")
public class AutomovilServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        AutomovilService service = new AutomovilService();
        
        request.setAttribute("hashMap", service.getHashMap());
        request.setAttribute("linkedHashMap", service.getLinkedHashMap());
        request.setAttribute("treeMap", service.getTreeMap());
        
        RequestDispatcher rd = request.getRequestDispatcher("listarAutos.jsp");
        rd.forward(request, response);
    }
}
