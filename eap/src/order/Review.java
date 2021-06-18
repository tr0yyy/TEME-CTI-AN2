package order;

public class Review {
    private static Integer countReviewuri = 0;
    private final Integer idReview;
    private String username;
    private Integer idComanda;
    private Integer stele;
    private String recenzie;

    public Review() {
        countReviewuri++;
        this.idReview = countReviewuri;
    }

    public Review(Integer idReview, String username, Integer idComanda, Integer stele, String recenzie) {
        countReviewuri++;
        this.idReview = countReviewuri;
        this.username = username;
        this.idComanda = idComanda;
        this.stele = stele;
        this.recenzie = recenzie;
    }

    public Integer getIdReview() {
        return idReview;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getIdComanda() {
        return idComanda;
    }

    public void setIdComanda(Integer idComanda) {
        this.idComanda = idComanda;
    }

    public Integer getStele() {
        return stele;
    }

    public void setStele(Integer stele) {
        this.stele = stele;
    }

    public String getRecenzie() {
        return recenzie;
    }

    public void setRecenzie(String recenzie) {
        this.recenzie = recenzie;
    }
}
