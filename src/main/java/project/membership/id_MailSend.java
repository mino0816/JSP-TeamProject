package project.membership;


public class id_MailSend {
	
	//정상적인 id와 email을 입력 받으면 true 리턴
	public boolean sendId(String member_name, String member_email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String user_id = mgr.findId(member_name, member_email);
		System.out.println("회원님의 ID는 " + user_id + "입니다.");
		if(user_id!=null) {
			String title = "EATING에서 id를 전송합니다.";
			String content = "회원님의 ID는 " + user_id + "입니다.";
			GmailSend.send(title, content, member_email);
			flag = true;
		}
		return flag;
	}
	

}
