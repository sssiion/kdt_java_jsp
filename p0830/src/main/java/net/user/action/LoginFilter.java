package net.user.action;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("*.bo")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        String userId = (String) session.getAttribute("id");
        
        if(userId == null) {
            // 로그인되지 않은 경우
            httpResponse.setContentType("text/html;charset=utf-8");
            httpResponse.getWriter().println("<script>");
            httpResponse.getWriter().println("alert('로그인이 필요합니다.');");
            httpResponse.getWriter().println("location.href='./loginForm.jsp';");
            httpResponse.getWriter().println("</script>");
            return;
        }
        
        // 로그인된 경우 다음 필터나 서블릿으로 진행
        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}
