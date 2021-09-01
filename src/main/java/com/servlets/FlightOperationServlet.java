
package com.servlets;

import com.dao.AirlinesDao;



import com.dao.FlightsDao;
import com.entities.Airlines;
import com.entities.Flights;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import org.hibernate.Session;
//import org.hibernate.Transaction;

@MultipartConfig
public class FlightOperationServlet extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Fetching Airline & Flight data
            String op = request.getParameter("operation");
            
            if(op.trim().equals("addairlines")){
                
                
                // add airlines
                String aTitle = request.getParameter("airlinesTitle");
                
                Airlines airlines = new Airlines();
                
                airlines.setAirlinesTitle(aTitle);
                
                // Saving to DB
                AirlinesDao airlinesDao = new AirlinesDao(FactoryProvider.getFactory());
                int airlinesId = airlinesDao.saveAirlines(airlines);
                
                //out.println("Airline Saved");
                HttpSession session = request.getSession();

                session.setAttribute("message", "Airlines added Successfully !  Id is : " + airlinesId);
                response.sendRedirect("admin.jsp");
                return;
                
                
            }else if(op.trim().equals("addflight")){
                
                
                //add flights
                int airlinesId=Integer.parseInt(request.getParameter("airlinesId"));
                String fName = request.getParameter("fName");
                String fromLocation = request.getParameter("fromLocation");
                String toLocation = request.getParameter("toLocation");
                int fPrice = Integer.parseInt(request.getParameter("fPrice"));
                int fQuantity = Integer.parseInt(request.getParameter("fQuantity"));
                Date fDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fDate"));
                
                Flights f = new Flights();
                f.setfDate(fDate);
                f.setfName(fName);
                f.setfPrice(fPrice);
                f.setFromLocation(fromLocation);
                f.setToLocation(toLocation);
                f.setfQuantity(fQuantity);
                //for getting Airlines by Id
                
                AirlinesDao adao=new AirlinesDao(FactoryProvider.getFactory());
                Airlines airlines =adao.getAirlinesById(airlinesId);
                
                f.setAirlines(airlines);
                
                // Save to DB
                FlightsDao fdao = new FlightsDao(FactoryProvider.getFactory());
                fdao.saveFlights(f);
                //out.println("flight save success");
                HttpSession session = request.getSession();

                session.setAttribute("message", "Flight added Successfully !  Id is : " + fName);
                response.sendRedirect("admin.jsp");
                return;
            
            
            
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(FlightOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(FlightOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
