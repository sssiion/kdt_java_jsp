package net.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.user.db.UserDAO;
import net.board.action.Action;
import net.board.action.ActionForward;
import net.user.db.UserBean;

public class LoginAction implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        ActionForward forward = new ActionForward();
        request.setCharacterEncoding("utf-8");
        
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        UserDAO userDao = new UserDAO();
        int loginResult = userDao.userLogin(id, pw);
        
        if(loginResult == 1) {
            // 로그인 성공
            UserBean user = userDao.getUserInfo(id);
            HttpSession session = request.getSession();
            
            session.setAttribute("id", user.getId());
            session.setAttribute("name", user.getName());
            session.setAttribute("auth", user.isAuth());
            session.setAttribute("userNumber", user.getNumber());
            session.setAttribute("intro", user.getIntro());
            session.setAttribute("addr", user.getAddrnumber());
            session.setAttribute("email", user.getEmail());
            
            System.out.println("로그인 성공: " + id);
            
            forward.setRedirect(true);
            forward.setPath("./Main.jsp");
            
        } else {
            // 로그인 실패
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            
            if(loginResult == -1) {
                out.println("alert('존재하지 않는 아이디입니다.');");
            } else if(loginResult == 0) {
                out.println("alert('비밀번호가 틀렸습니다.');");
            } else {
                out.println("alert('데이터베이스 오류가 발생했습니다.');");
            }
            
            out.println("location.href='./loginForm.jsp';");
            out.println("</script>");
            out.close();
            return null;
        }
        
        return forward;
    }
}
