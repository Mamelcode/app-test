package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

// 포스트 등록 처리하는곳

@WebServlet("/post/post-task")
public class PostTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		User one = (User)session.getAttribute("logonUser");
		
		
		String id = UUID.randomUUID().toString().split("-")[0];
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		String userId;
		
		
		if(req.getParameter("userId") != null) {
			userId = req.getParameter("userId");
		}else {
			userId = one.getId();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		map.put("userid", userId);
		
		if(req.getParameter("userpass") != null) {
			String userPass = req.getParameter("userpass");
			map.put("userpass", userPass);
		}
		//=========================================================
		SqlSessionFactory factory = (SqlSessionFactory)
				req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.insert("post.create", map);
		sqlSession.close();
		//=========================================================
		
		if(result == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		resp.sendRedirect("/post/post-list");
		return;
	}
}
