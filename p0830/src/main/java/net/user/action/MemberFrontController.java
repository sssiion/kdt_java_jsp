package net.user.action;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;

import javax.servlet.RequestDispatcher;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public MemberFrontController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        ActionForward forward = null;
        Action action = null;
        
        if(command.equals("/login.me")) {
            action = new LoginAction();
            try {
                forward = action.execute(request, response);
            } catch(Exception e) {
                e.printStackTrace();
            }
            
        } else if(command.equals("/joinForm.me")) {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("./joinForm.jsp");
            
        } else if(command.equals("/join.me")) {
            action = new JoinAction();
            try {
                forward = action.execute(request, response);
            } catch(Exception e) {
                e.printStackTrace();
            }
            
        } else if(command.equals("/logout.me")) {
            action = new LogoutAction();
            try {
                forward = action.execute(request, response);
            } catch(Exception e) {
                e.printStackTrace();
            }
            
        } else if(command.equals("/memberList.me")) {
            action = new MemberListAction();
            try {
                forward = action.execute(request, response);
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        
        if(forward != null) {
            if(forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doProcess(request, response);
    }
}
