public class Data {

@SerializedName("Country")
@Expose
private String country;
@SerializedName("CountryCode")
@Expose
private String countryCode;
@SerializedName("Lat")
@Expose
private String lat;
@SerializedName("Lon")
@Expose
private String lon;
@SerializedName("Cases")
@Expose
private Integer cases;
@SerializedName("Status")
@Expose
private String status;
@SerializedName("Date")
@Expose
private String date;

public String getCountry() {
return country;
}

public void setCountry(String country) {
this.country = country;
}

public String getCountryCode() {
return countryCode;
}

public void setCountryCode(String countryCode) {
this.countryCode = countryCode;
}

public String getLat() {
return lat;
}

public void setLat(String lat) {
this.lat = lat;
}

public String getLon() {
return lon;
}

public void setLon(String lon) {
this.lon = lon;
}

public Integer getCases() {
return cases;
}

public void setCases(Integer cases) {
this.cases = cases;
}

public String getStatus() {
return status;
}

public void setStatus(String status) {
this.status = status;
}

public String getDate() {
return date;
}

public void setDate(String date) {
this.date = date;
}

}
