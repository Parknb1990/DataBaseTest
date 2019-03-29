package user;

public class UserDTO {

	private String userID;
	private String userPW;
	private String userName;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public UserDTO(String userID, String userPW, String userName) {
		super();
		this.userID = userID;
		this.userPW = userPW;
		this.userName = userName;
	}
	
	public UserDTO() {
	
	}
	
}
