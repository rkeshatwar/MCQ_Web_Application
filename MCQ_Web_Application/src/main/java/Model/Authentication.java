package Model;

public class Authentication {
	private String userType;
	private String userData;
	private String password;
	private String userName;
	private String userEmailId;
	private String contactNumber;
	private String gender;
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserData() {
		return userData;
	}
	public void setUserData(String userData) {
		this.userData = userData;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmailId() {
		return userEmailId;
	}
	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
