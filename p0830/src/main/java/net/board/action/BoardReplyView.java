package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardBean;

public class BoardReplyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
			BoardDAO boarddao=new BoardDAO();
	   		BoardBean boarddata=new BoardBean();
	   		
	   		int num=Integer.parseInt(request.getParameter("num"));
	   		
	   		boarddata=boarddao.getDetail(num);
	   		
	   		if(boarddata==null){
	   			System.out.println("���� ������ �̵� ����");
	   			return null;
	   		}
	   		System.out.println("���� ������ �̵� �Ϸ�");
	   		
	   		request.setAttribute("boarddata", boarddata);
	   		
	   		forward.setRedirect(false);
	   		forward.setPath("./p0917/board/qna_board_reply.jsp");
	   		return forward;
	}
}