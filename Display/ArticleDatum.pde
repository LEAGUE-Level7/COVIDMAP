public class ArticleDatum{
  @SerializedName("title")
    @Expose
    private String title;
  @SerializedName("description")
    @Expose
    private String description;
  @SerializedName("author")
    @Expose
    private String author;
  @SerializedName("url")
    @Expose
    private String url;
  @SerializedName("publishedAt")
    @Expose
    private String publishedAt;
    
  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }
  
  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }
  
  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }
  
  public String getURL() {
    return url;
  }

  public void setURL(String url) {
    this.url = url;
  }
  
  public String getPublishedAt() {
    return publishedAt;
  }

  public void setPublishedAt(String publishedAt) {
    this.publishedAt = publishedAt;
  }
}
