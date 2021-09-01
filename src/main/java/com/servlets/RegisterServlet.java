
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
//import org.hibernate.Session;
//import org.hibernate.Transaction;


public class RegisterServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
             try {
                String userName = request.getParameter("name");
                String userEmail = request.getParameter("email");
                String userPassword = request.getParameter("password");
                String userPhone = request.getParameter("phone");
                String userAddress = request.getParameter("address");
                 
                // validation
              if (userName.isEmpty() && userEmail.isEmpty() && userPassword.isEmpty() && userPhone.isEmpty() && userAddress.isEmpty()) {
                    out.println("Fill all the required details !! ");
                    return;
                }
                //User Object creation
                 User user = new User();
                 user.setUserName(userName);
                 user.setUserEmail(userEmail);
                 user.setUserPassword(userPassword);
                 user.setUserPhone(userPhone);
                 user.setUserAddress(userAddress);
                 user.setUserPic("default.png");//default image for profile pic
                 user.setUserType("normal");// only admin for admin level reg
                 
                 UserDao userDao = new UserDao(FactoryProvider.getFactory());
                 userDao.saveUser(user);
                
                HttpSession httpsession=request.getSession();
                httpsession.setAttribute("message", "Registration Successful ^_^"+" "+userName);
                response.sendRedirect("register.jsp");
                return;
            } catch (Exception e) {
                e.printStackTrace();
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
