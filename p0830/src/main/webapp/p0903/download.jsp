<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
    <%
    String uploadPath = request.getRealPath("upload");
	String fileName = request.getParameter("file");	
	response.setContentType("application/octet-stream");
	File file = new File(uploadPath, fileName);
	
	if(file.exists() && file.isFile()) {
        // 1. 헤더 설정
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.setContentLength((int)file.length());
        
        // 2. 파일 읽기 및 전송
        FileInputStream fis = new FileInputStream(file);
        ServletOutputStream sos = response.getOutputStream();
        
        byte[] buffer = new byte[4096];
        int bytesRead;
        
        while((bytesRead = fis.read(buffer)) != -1) {
            sos.write(buffer, 0, bytesRead);
        }
        
        // 3. 리소스 정리
        fis.close();
        sos.flush();
        sos.close();
    } else {
        out.println("<script>alert('파일을 찾을 수 없습니다.'); history.back();</script>");
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>