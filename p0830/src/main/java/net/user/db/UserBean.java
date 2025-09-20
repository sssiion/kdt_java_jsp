package net.user.db;

public class UserBean {
    private String id;
    private String name;
    private String pw;
    private String number;
    private String email;
    private String hnumber;
    private String addr;
    private String addrnumber;
    private String intro;
    private boolean auth; // 관리자 권한

    // 생성자
    public UserBean() {}

    public UserBean(String id, String name, String pw, String number, String email, 
                    String hnumber, String addr, String addrnumber, String intro) {
        this.id = id;
        this.name = name;
        this.pw = pw;
        this.number = number;
        this.email = email;
        this.hnumber = hnumber;
        this.addr = addr;
        this.addrnumber = addrnumber;
        this.intro = intro;
        this.auth = false; // 기본값은 일반 사용자
    }

    // Getter와 Setter 메서드들
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPw() { return pw; }
    public void setPw(String pw) { this.pw = pw; }

    public String getNumber() { return number; }
    public void setNumber(String number) { this.number = number; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getHnumber() { return hnumber; }
    public void setHnumber(String hnumber) { this.hnumber = hnumber; }

    public String getAddr() { return addr; }
    public void setAddr(String addr) { this.addr = addr; }

    public String getAddrnumber() { return addrnumber; }
    public void setAddrnumber(String addrnumber) { this.addrnumber = addrnumber; }

    public String getIntro() { return intro; }
    public void setIntro(String intro) { this.intro = intro; }

    public boolean isAuth() { return auth; }
    public void setAuth(boolean auth) { this.auth = auth; }
}

