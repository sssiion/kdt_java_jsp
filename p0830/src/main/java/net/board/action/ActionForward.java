package net.board.action;

public class ActionForward {
 // 전송방식을 결정
	private boolean isRedirect=false;
	private String path=null;
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
