package controllers.posts;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Post;
import utils.DBUtil;

/**
 * Servlet implementation class PostsDestroyServlet
 */
@WebServlet("/posts/destroy")
public class PostsDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostsDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
            if(_token != null && _token.equals(request.getSession().getId())) {
                EntityManager em = DBUtil.createEntityManager();

                // セッションスコープから投稿のIDを取得して
                // 該当のIDの投稿1件のみをデータベースから取得
                Post p = em.find(Post.class, (Integer)(request.getSession().getAttribute("post_id")));


                em.getTransaction().begin();
                em.remove(p);       // データ削除
                em.getTransaction().commit();
                em.close();

                // セッションスコープ上の不要になったデータを削除
                request.getSession().removeAttribute("post_id");


                response.sendRedirect(request.getContextPath() + "/posts/index");
            }
    }

}
