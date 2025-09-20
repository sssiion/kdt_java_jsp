package net.board.action;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("/BoardFrontController")
public class BoardFrontController extends HttpServlet implements Servlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
    	String RequestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command= RequestURI.substring(contextPath.length());
    	ActionForward forward=null;
    	Action action=null;
    	
    	if(command.equals("/BoardList.bo")) {
    		action = new BoardListAction();
    		try {
    			forward = action.execute(request, response);
    			
    		}catch(Exception e ) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/BoardWrite.bo")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./p0917/board/qna_board_write.jsp");
    	}else if(command.equals("/BoardAddAction.bo")) {
    		action = new BoardAddAction();
    		try {
    			forward = action.execute(request, response);
    			
    		}catch(Exception e ) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/BoardReplyAction.bo")){
			   action = new BoardReplyView();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardDelete.bo")){
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./p0917/board/qna_board_delete.jsp");
		}else if(command.equals("/BoardModify.bo")){
			   action = new BoardModifyView();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
	 	   }else if(command.equals("/BoardReplyView.bo")){
			   action = new BoardReplyAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardModifyAction.bo")){
			   action = new BoardModifyAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardDeleteAction.bo")){
			   action = new BoardDeleteAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardDetailAction.bo")){
			   action = new BoardDetailAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
    	
    	if(forward.isRedirect()) {
    		response.sendRedirect(forward.getPath());
    	}else {
    		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    		dispatcher.forward(request, response);
    	}
    	
    	
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doProcess(request,response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
	   doProcess(request,response);
   }

}
