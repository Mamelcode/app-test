package controller.post;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Post;
import data.User;

// 글쓰기로 보내는곳

@WebServlet("/post/posting-view")
public class PostViewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String modify = req.getParameter("modify");
		
		if(modify == null) {
			req.getRequestDispatcher("/WEB-INF/views/post/postingview.jsp").forward(req, resp);
			return;
		}else {
			//=========================================================
			SqlSessionFactory factory = (SqlSessionFactory)
					req.getServletContext().getAttribute("sqlSessionFactory");
			SqlSession sqlSession = factory.openSession();
			//=========================================================
			Post one = sqlSession.selectOne("post.findByPost", id);
			req.setAttribute("modifyPost", one);
		}
		req.getRequestDispatcher("/WEB-INF/views/post/modify-task.jsp").forward(req, resp);
	}
}
