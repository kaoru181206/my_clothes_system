package controllers.likes;

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
 * Servlet implementation class LikesCreateServlet
 */
@WebServlet("/likes/create")
public class LikesCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikesCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // CSRF対策チェック
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())){

       EntityManager em = DBUtil.createEntityManager();



       // セッションスコープからレポートのIDを取得して、該当のレポートIDのレポートをデータベースから取得
       Post p = em.find(Post.class, (Integer) (request.getSession().getAttribute("post_id")));

       // いいねプロパティにvalue(1)を上書き
       p.setLikes(p.getLikes() + 1);

       em.getTransaction().begin();
       em.getTransaction().commit();
       em.close();
       request.getSession().setAttribute("flush", "いいねしました。");

       // セッションスコープの不要になったデータを削除
       request.getSession().removeAttribute("post_id");

       // indexページへリダイレクト
       response.sendRedirect(request.getContextPath() + "/posts/index");

   }
    }

}
