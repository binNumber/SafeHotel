package test;

import com.app.dao.user.impl.UserDAOImpl;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public class testMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UserDAOImpl userDAOImpl = new UserDAOImpl(); 

		UserSearchCondition us = new UserSearchCondition();
		us.setUserEmail("leejinsoo1053@example.com");
		us.setUserPw("jinsulee1053");
		us.setUserType("CUS");
		
		User user = userDAOImpl.findUserByUserSearchCondition(us);
		
		
		System.out.println(user.getUserCode() + " " + user.getUserEmail() + " " + user.getUserName());
	}

}
