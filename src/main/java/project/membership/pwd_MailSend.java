package project.membership;


public class pwd_MailSend {
	
	//정상적인 id와 email을 입력 받으면 true 리턴
	public boolean sendPwd(String user_id, String member_name, String member_email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String member_pwd = mgr.findPwd(user_id, member_name, member_email);
		System.out.println("회원님의 패스워드는 " + member_pwd + "입니다.");
		if(member_pwd!=null) {
			String title = "EATING에서 패스워드를 전송합니다.";
			String content = "회원님의 패스워드는 " + member_pwd + "입니다.";
			GmailSend.send(title, content, member_email);
			flag = true;
		}
		return flag;
	}
	

}
