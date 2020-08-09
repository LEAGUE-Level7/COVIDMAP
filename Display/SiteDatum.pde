public class SiteDatum{
  @SerializedName("St. Anthony's of Padua Parking Lot")
    @Expose
    private String stAnthony;
  
  @SerializedName("Tubman-Chavez Community Center")
    @Expose
    private List <ArticleDatum> tubmanChavez;
    
  public Integer getTotalResults() {
    return totalResults;
  }

  public void setTotalResults(Integer totalResults) {
    this.totalResults = totalResults;
  }
  
  public List<ArticleDatum> getArticles() {
    return articles;
  }

  public void setArticles(List<ArticleDatum> articles) {
    this.articles = articles;
  }
}
