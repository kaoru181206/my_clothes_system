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
import models.validators.PostValidator;
import utils.DBUtil;

/**
 * Servlet implementation class PostsUpdateServlet
 */
@WebServlet("/posts/update")
public class PostsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostsUpdateServlet() {
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

                Post p = em.find(Post.class, (Integer)(request.getSession().getAttribute("post_id")));

                p.setPurchase_date(Date.valueOf(request.getParameter("purchase_date")));

                p.setBrandName(request.getParameter("brandName"));
                p.setPrice(Integer.parseInt(request.getParameter("price")));
                p.setCategory(Integer.parseInt(request.getParameter("category")));
                p.setContent(request.getParameter("content"));
                p.setUpdated_at(new Timestamp(System.currentTimeMillis()));


                List<String> errors = PostValidator.validate(p);
                    if(errors.size() > 0) {
                        em.close();

                        request.setAttribute("_token", request.getSession().getId());
                        request.setAttribute("post", p);
                        request.setAttribute("errors", errors);

                        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/posts/edit.jsp");
                        rd.forward(request, response);

                    }else{
                        em.getTransaction().begin();
                        em.getTransaction().commit();
                        em.close();
                        request.getSession().setAttribute("flush", "??????????????????????????????");

                        request.getSession().removeAttribute("post_id");

                        response.sendRedirect(request.getContextPath() + "/posts/index");
                    }
            }

    }

}
