package controllers.posts;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Post;
import models.User;
import models.validators.PostValidator;
import utils.DBUtil;

/**
 * Servlet implementation class PostsCreateServlet
 */
@WebServlet("/posts/create")
public class PostsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostsCreateServlet() {
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

            Post p = new Post();

            p.setUser((User)request.getSession().getAttribute("login_user"));

            Date purchase_date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("purchase_date");
            if(rd_str != null && !rd_str.equals("")) {
                purchase_date = Date.valueOf(request.getParameter("purchase_date"));
            }

            p.setPurchase_date(purchase_date);

            p.setBrandName(request.getParameter("brandName"));
            p.setPrice(Integer.parseInt(request.getParameter("price")));
            p.setCategory(Integer.parseInt(request.getParameter("category")));
            p.setContent(request.getParameter("content"));


            p.setLikes(0);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            p.setCreated_at(currentTime);
            p.setUpdated_at(currentTime);

            List<String> errors = PostValidator.validate(p);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("post", p);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/posts/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(p);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "投稿が完了しました。");

                response.sendRedirect(request.getContextPath() + "/posts/index");
            }
        }
    }

}
