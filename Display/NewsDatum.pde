import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class NewsDatum{
  @SerializedName("totalResults")
    @Expose
    private Integer totalResults;
  
  @SerializedName("articles")
    @Expose
    private List <ArticleDatum> articles;
    
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
