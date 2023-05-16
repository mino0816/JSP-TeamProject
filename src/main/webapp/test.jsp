<%@page import="test.TestBean"%>
<%@page import="project.comment.CommentBean"%>
<%@page import="java.util.Vector"%>
<%@page import="test.TestMgr"%>
<%@page import="project.bookmark.BookmarkBean"%>
<%@page import="project.bookmark.BookmarkMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
 
<%
	TestMgr mgr = new TestMgr();
	Vector<TestBean> vlist =  mgr.get();
			
	
%>
<form>
<select name="job">
<%
	for(int i=0; i<vlist.size();i++){
		
		TestBean bean = vlist.get(i);
%>
    <option value="option<%=bean.getId()%>"><%=bean.getName()%></option>
    
<%
	}
%>    
</select>
    <input type="text" name="text" value="text"/>
    <input type="submit" value="제출" action="test.jsp"></input>
</form>
