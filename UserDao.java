package JavaStuff;

import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private List<User> users = new ArrayList<>();

    public UserDao() {
        // Dummy data for users
        users.add(new User("admin", "adminPass", "admin"));
        users.add(new User("johnDoe", "customerPass", "customer"));
        users.add(new User("customerRep1", "repPass", "customerRep"));
    }

    public List<User> getAllUsers() {
        return users;  
    }

    public boolean addUser(User user) {
        for (User existingUser : users) {
            if (existingUser.getUsername().equals(user.getUsername())) {
                return false; 
            }
        }
        users.add(user);
        return true; 
    }

    public User getUser(String username, String password) {
        for (User user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return user;  
            }
        }
        return null;  
    }

    public boolean updateUser(String username, String newPassword, String newRole) {
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                user.setPassword(newPassword);  
                user.setRole(newRole);  
                return true;  
            }
        }
        return false;  
    }

    public boolean deleteUser(String username) {
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                users.remove(user); 
                return true;  
            }
        }
        return false;  
    }
}
