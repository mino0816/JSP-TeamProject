package project.noticeBoard;

public class NoticeBoardBean {
	private int notice_id;
	private String notice_userid;
	private int rest_id;
	private String notice_content;
	private String notice_datetime;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_userid() {
		return notice_userid;
	}
	public void setNotice_userid(String notice_userid) {
		this.notice_userid = notice_userid;
	}
	public int getRest_id() {
		return rest_id;
	}
	public void setRest_id(int rest_id) {
		this.rest_id = rest_id;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_datetime() {
		return notice_datetime;
	}
	public void setNotice_datetime(String notice_datetime) {
		this.notice_datetime = notice_datetime;
	}
	
}
