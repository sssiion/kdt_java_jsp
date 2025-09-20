package net.user.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.action.Action;
import net.board.action.ActionForward;

public class LogoutAction implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        ActionForward forward = new ActionForward();
        
        HttpSession session = request.getSession();
        session.invalidate(); // 세션 무효화
        
        System.out.println("로그아웃 완료");
        
        forward.setRedirect(true);
        forward.setPath("./loginForm.jsp");
        
        return forward;
    }
}
