
package com.servlets;

import com.dao.UserDao;

import com.entities.User;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JEET
 */
public class LoginServlet extends HttpServlet {

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
            //fecting form data
            String email = request.getParameter("email");

            String password = request.getParameter("password");

            out.println(email);
            out.println(password);

            //validation
            //authentication
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            out.println(userDao);
            User user = userDao.getUserByEmailAndPasswor(email, password);
            HttpSession session = request.getSession();
            if (user == null) {

                session.setAttribute("message", "Invalid Credentials !! Try again.");
                response.sendRedirect("login.jsp");
                return;
            } else {

                session.setAttribute("current-user", user);
                //admin condition
                if (user.getUserType().equals("admin")) {

                    response.sendRedirect("admin.jsp");

                } else if (user.getUserType().equals("normal")) {
                    //user condition
                    response.sendRedirect("normal.jsp");
                } else {

                    out.println("Unable to detect user type !!");
                }

            }
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
