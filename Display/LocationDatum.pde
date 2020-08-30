public class LocationDatum {

  @SerializedName("city")
    @Expose
    private String city;
  @SerializedName("address")
    @Expose
    private String address;
  @SerializedName("Monday")
    @Expose
    private String mon;
  @SerializedName("Tuesday")
    @Expose
    private String tue;
  @SerializedName("Wednesday")
    @Expose
    private String wed;
  @SerializedName("Thursday")
    @Expose
    private String thu;
  @SerializedName("Friday")
    @Expose
    private String fri;
  @SerializedName("Saturday")
    @Expose
    private String sat;
  @SerializedName("Sunday")
    @Expose
    private String sun;

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }
  
  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }
  
  public String getMonday() {
    return mon;
  }

  public void setMonday(String mon) {
    this.mon = mon;
  }
  
  public String getTuesday() {
    return tue;
  }

  public void setTuesday(String tue) {
    this.tue = tue;
  }
  
  public String getWednesday() {
    return wed;
  }

  public void setWednesday(String wed) {
    this.wed = wed;
  }
  
  public String getThursday() {
    return thu;
  }

  public void setThursday(String thu) {
    this.thu = thu;
  }
  
  public String getFriday() {
    return fri;
  }

  public void setFriday(String fri) {
    this.fri = fri;
  }
  
  public String getSaturday() {
    return sat;
  }

  public void setSaturday(String sat) {
    this.sat = sat;
  }
  
  public String getSunday() {
    return sun;
  }

  public void setSunday(String sun) {
    this.sun = sun;
  }
}
