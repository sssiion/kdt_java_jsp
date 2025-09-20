package net.user.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.user.db.UserDAO;
import net.board.action.Action;
import net.board.action.ActionForward;
import net.user.db.UserBean;

public class JoinAction implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        ActionForward forward = new ActionForward();
        request.setCharacterEncoding("utf-8");
        
        // 파라미터 받기
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String userNumber = request.getParameter("numberic_pre") + request.getParameter("numberic_last");
        String intro = request.getParameter("intro");
        String name = request.getParameter("name");
        String addr = request.getParameter("addr_number");
        String email = request.getParameter("email_pre") + "@" + request.getParameter("email_last");
        
        UserDAO userDao = new UserDAO();
        UserBean user = new UserBean();
        
        // 아이디 중복 체크
        if(userDao.isUserIdExist(id)) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('이미 존재하는 아이디입니다.');");
            out.println("location.href='./joinForm.jsp';");
            out.println("</script>");
            out.close();
            return null;
        }
        
        // UserBean에 데이터 설정
        user.setId(id);
        user.setPw(pw);
        user.setNumber(userNumber);
        user.setIntro(intro);
        user.setName(name);
        user.setAddrnumber(addr);
        user.setEmail(email);
        
        boolean result = userDao.userInsert(user);
        
        if(result) {
            System.out.println("회원가입 완료");
            forward.setRedirect(true);
            forward.setPath("./loginForm.jsp");
        } else {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('회원가입에 실패했습니다.');");
            out.println("location.href='./joinForm.jsp';");
            out.println("</script>");
            out.close();
            return null;
        }
        
        return forward;
    }
}
