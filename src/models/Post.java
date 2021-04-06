package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "posts")
@NamedQueries({
    @NamedQuery(
        name = "getAllPosts",
        query = "SELECT p FROM Post AS p ORDER BY p.id DESC"
    ),
    @NamedQuery(
        name = "getPostCount",
        query = "SELECT COUNT(p) FROM Post AS p"
    ),
})
@Entity
public class Post {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "purchase_date", nullable = false)
    private Date purchase_date;

    @Column(name = "brandName", length = 255, nullable = false)
    private String brandName;

    @Column(name = "price", nullable = false)
    private Integer price;

    @Column(name = "likes", nullable = false)
    private Integer likes;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @Column(name = "post_flag", nullable = false)
    private Integer post_flag;

    @Column(name = "category", nullable = false)
    private Integer category;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getPurchase_date() {
        return purchase_date;
    }

    public void setPurchase_date(Date purchase_date) {
        this.purchase_date = purchase_date;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public Integer getPost_flag() {
        return post_flag;
    }

    public void setPost_flag(Integer post_flag) {
        this.post_flag = post_flag;
    }

    public Integer getcategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }


}
