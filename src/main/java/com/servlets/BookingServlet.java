
package com.servlets;

import com.dao.BookingsDao;


import com.entities.Bookings;
import com.entities.User;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BookingServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String pName = request.getParameter("pName");
            String pGender = request.getParameter("pGender");
            String pContact =request.getParameter("pContact");
            String pMethod = request.getParameter("pMethod");
            String fName = request.getParameter("fName");
            Bookings b=new Bookings();
            b.setpName(pName);
            b.setfName(fName);
            
            b.setpGender(pGender);
            b.setpContact(pContact);
            b.setpPaymentMode(pMethod);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current-user");
           
            b.setUser(user);
             //Save to DB
                BookingsDao bdao = new BookingsDao(FactoryProvider.getFactory());
                bdao.saveBookings(b);
                

                session.setAttribute("message", "Booking Successful ^-^  For Passenger : " + pName);
                response.sendRedirect("normal.jsp");
                return;
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
