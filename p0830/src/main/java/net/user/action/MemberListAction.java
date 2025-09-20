package net.user.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.user.db.UserDAO;
import net.board.action.Action;
import net.board.action.ActionForward;
import net.user.db.UserBean;

public class MemberListAction implements Action {
    
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        ActionForward forward = new ActionForward();
        request.setCharacterEncoding("utf-8");
        
        // 관리자 권한 체크
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");
        Boolean isAdmin = (Boolean) session.getAttribute("auth");
        
        if(userId == null || isAdmin == null || !isAdmin) {
            // 관리자가 아닌 경우 접근 거부
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("<script>");
            response.getWriter().println("alert('관리자만 접근 가능합니다.');");
            response.getWriter().println("location.href='./Main.jsp';");
            response.getWriter().println("</script>");
            return null;
        }
        
        UserDAO userDao = new UserDAO();
        
        // 페이징 처리
        int page = 1;
        int limit = 10;
        
        if(request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        int totalCount = userDao.getUserCount();
        List<UserBean> memberList = userDao.getMemberList(page, limit);
        
        // 페이징 계산
        int maxpage = (int)((double)totalCount / limit + 0.95);
        int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
        int endpage = maxpage;
        
        if(endpage > startpage + 10 - 1) {
            endpage = startpage + 10 - 1;
        }
        
        // request에 데이터 설정
        request.setAttribute("page", page);
        request.setAttribute("maxpage", maxpage);
        request.setAttribute("startpage", startpage);
        request.setAttribute("endpage", endpage);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("memberList", memberList);
        
        System.out.println("회원 목록 조회 완료");
        
        forward.setRedirect(false);
        forward.setPath("./memberList.jsp");
        
        return forward;
    }
}
