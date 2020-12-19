package com.servlets;
import com.entities.*;
import com.helper.FactoryProvider;
import com.mysql.cj.Session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				System.out.println( title + " : " + content);
				Note note = new Note(title, content, new Date());

				org.hibernate.Session session = FactoryProvider.getFactory().openSession();
				Transaction tx = session.beginTransaction();
				session.save(note);
				
				tx.commit();
				session.close();
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
			
				response.getWriter().println("<h2>Note added Successfully</h2>");
				response.getWriter().println("<a href=\"show_all_notes.jsp\">Show all notes</a>");
				
				
				
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
