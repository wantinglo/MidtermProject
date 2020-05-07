package tw.wantinglo.model.member;
import javax.servlet.http.HttpSession;
// �n�X�ɻݭn�����Ƽg�b�o�̡A�psession.invalidate()
public class LogoutBean {
   
	HttpSession session;
	
	public HttpSession getSession() {
		return session;
	}
	
	public void setSession(HttpSession session) {
		this.session = session;
	}

	public Integer getLogout() { // logout 
		session.invalidate();
		return 0;
	}
}
