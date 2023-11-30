public class InformationGetter {

	private String username, password, website, url;
	
	public InformationGetter(String u, String p, String w, String ur) {
		this.username = u;
		this.password = p;
		this.website = w;
		this.url = ur;
	}
	
	public String getUsername() { return this.username; }
	public void setUsername(String s) { this.username = s; }
	
	public String getPassword() { return this.password; }
	public void setPassword(String s) { this.password = s; }
	
	public String getWebsite() { return this.website; }
	public void setWebsite(String s) { this.website = s; }
	
	public String getUrl() { return this.url; }
	public void setUrl(String s) { this.url = s; }
	
	public String toString() {
		String s = "";
		s += "Username: " + this.username + ", Password: " + this.password + ", Website: " + this.website + ", URL: " + this.url;
		return s;
	}
}
