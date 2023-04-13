package project.comment;

public class CommentBean {
	int comment_id;
	int comment_post_id;
	String user_id;
	String comment_text;
	int pos;
	int ref;
	int depth;
	String comment_datetime;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getComment_post_id() {
		return comment_post_id;
	}
	public void setComment_post_id(int comment_post_id) {
		this.comment_post_id = comment_post_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getComment_datetime() {
		return comment_datetime;
	}
	public void setComment_datetime(String comment_datetime) {
		this.comment_datetime = comment_datetime;
	}
	
}
