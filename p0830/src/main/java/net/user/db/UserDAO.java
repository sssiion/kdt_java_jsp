package net.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    DataSource ds;

    public UserDAO() {
        try {
            Context init = new InitialContext();
            ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
        } catch(Exception ex) {
            System.out.println("UserDAO db 연결 실패: " + ex);
            return;
        }
    }

    // 회원가입
    public boolean userInsert(User user) {
        String sql = "INSERT INTO login (Id, Pw, auth, userNumber, intro, addr, Name, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        boolean result = false;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPw());
            pstmt.setBoolean(3, false); // 일반 사용자로 기본 설정
            pstmt.setString(4, user.getNumber());
            pstmt.setString(5, user.getIntro());
            pstmt.setString(6, user.getAddrnumber());
            pstmt.setString(7, user.getName());
            pstmt.setString(8, user.getEmail());
            
            int executeResult = pstmt.executeUpdate();
            
            if(executeResult > 0) {
                result = true;
                System.out.println("회원가입 성공");
            }
            
        } catch(Exception ex) {
            System.out.println("userInsert 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return result;
    }

    // 로그인 검증
    public int userLogin(String id, String pw) {
        String sql = "SELECT Pw, auth, userNumber, intro, addr, Name, email FROM login WHERE Id = ?";
        int result = -1; // -1: 아이디 없음, 0: 비밀번호 틀림, 1: 로그인 성공
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                String dbPw = rs.getString("Pw");
                if(pw.equals(dbPw)) {
                    result = 1; // 로그인 성공
                } else {
                    result = 0; // 비밀번호 틀림
                }
            } else {
                result = -1; // 아이디 없음
            }
            
        } catch(Exception ex) {
            System.out.println("userLogin 실패: " + ex);
            result = -2; // 데이터베이스 오류
        } finally {
            closeResources();
        }
        
        return result;
    }

    // 사용자 정보 가져오기
    public User getUserInfo(String id) {
        String sql = "SELECT Id, Pw, auth, userNumber, intro, addr, Name, email FROM login WHERE Id = ?";
        User user = null;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                user = new User();
                user.setId(rs.getString("Id"));
                user.setPw(rs.getString("Pw"));
                user.setNumber(rs.getString("userNumber"));
                user.setIntro(rs.getString("intro"));
                user.setAddr(rs.getString("addr"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("email"));
            }
            
        } catch(Exception ex) {
            System.out.println("getUserInfo 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return user;
    }

    // 아이디 중복 체크
    public boolean isUserIdExist(String id) {
        String sql = "SELECT COUNT(*) FROM login WHERE Id = ?";
        boolean result = false;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next() && rs.getInt(1) > 0) {
                result = true; // 아이디 존재
            }
            
        } catch(Exception ex) {
            System.out.println("isUserIdExist 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return result;
    }

    // 사용자 정보 수정
    public boolean userUpdate(User user) {
        String sql = "UPDATE login SET Pw = ?, intro = ?, addr = ?, Name = ?, email = ? WHERE Id = ?";
        boolean result = false;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, user.getPw());
            pstmt.setString(2, user.getIntro());
            pstmt.setString(3, user.getAddrnumber());
            pstmt.setString(4, user.getName());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getId());
            
            int executeResult = pstmt.executeUpdate();
            
            if(executeResult > 0) {
                result = true;
                System.out.println("사용자 정보 수정 성공");
            }
            
        } catch(Exception ex) {
            System.out.println("userUpdate 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return result;
    }

    // 회원 탈퇴
    public boolean userDelete(String id, String pw) {
        String sql = "DELETE FROM login WHERE Id = ? AND Pw = ?";
        boolean result = false;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            
            int executeResult = pstmt.executeUpdate();
            
            if(executeResult > 0) {
                result = true;
                System.out.println("회원 탈퇴 성공");
            }
            
        } catch(Exception ex) {
            System.out.println("userDelete 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return result;
    }

    // 전체 회원 수 가져오기
    public int getUserCount() {
        String sql = "SELECT COUNT(*) FROM login";
        int count = 0;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                count = rs.getInt(1);
            }
            
        } catch(Exception ex) {
            System.out.println("getUserCount 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return count;
    }

    // 관리자 권한 확인
    public boolean isAdmin(String id) {
        String sql = "SELECT auth FROM login WHERE Id = ?";
        boolean result = false;
        
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                result = rs.getBoolean("auth");
            }
            
        } catch(Exception ex) {
            System.out.println("isAdmin 실패: " + ex);
        } finally {
            closeResources();
        }
        
        return result;
    }

    // 리소스 해제 메서드
    private void closeResources() {
        if(rs != null) {
            try {
                rs.close();
            } catch(SQLException ex) {
                System.out.println("ResultSet 닫기 실패: " + ex);
            }
        }
        if(pstmt != null) {
            try {
                pstmt.close();
            } catch(SQLException ex) {
                System.out.println("PreparedStatement 닫기 실패: " + ex);
            }
        }
        if(con != null) {
            try {
                con.close();
            } catch(SQLException ex) {
                System.out.println("Connection 닫기 실패: " + ex);
            }
        }
    }
}
