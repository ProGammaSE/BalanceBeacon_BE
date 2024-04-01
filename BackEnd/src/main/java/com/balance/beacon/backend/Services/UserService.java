package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.Login;
import com.balance.beacon.backend.Models.UserResponse;
import com.balance.beacon.backend.Models.Users;
import com.balance.beacon.backend.Repositories.UserRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Service
public class UserService {

    private final UserRepository userRepository;
    UserResponse userResponse = new UserResponse();
    Users dbUser = new Users();

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserResponse registerUser(Users user) {
        System.out.println("----- registerUser function is calling -----");

        // check whether the user is already exits in the database
        try {
            Users dbUser = userRepository.findByUserEmail(user.getUserEmail());

            if (dbUser != null) {
                System.out.println("The user exists in the database");
                userResponse.setResponseStatus(400);
                userResponse.setResponseDescription("Username already taken");
                userResponse.setUsers(user);
            }
            else {
                System.out.println("User does not available in the database");
                System.out.println("Therefore creating a new user");

                // get current timestamp
                user.setUserCreatedDate(new Timestamp(System.currentTimeMillis()));

                // adding the user
                dbUser = userRepository.save(user);
                userResponse.setResponseStatus(200);
                userResponse.setResponseDescription("User successfully registered");
                userResponse.setUsers(dbUser);
                System.out.println(user.getUserName() + " created successfully in the database");
            }

        } catch (Exception preEx) {
            System.out.println("User didn't insert to the database");
            userResponse.setResponseStatus(400);
            userResponse.setResponseDescription("Registration failed");
            userResponse.setUsers(user);
            System.out.println(preEx.getCause());
            System.out.println(preEx.getMessage());
            preEx.printStackTrace();
        }
        return userResponse;
    }

    public UserResponse deleteUser(String userEmail) {
        System.out.println("----- deleteUser function is calling -----");
        // check whether the username available in the database
        try {
            dbUser = userRepository.findByUserEmail(userEmail);

            if (dbUser != null) {
                System.out.println("User available in the database");
                System.out.println("Therefore deleting the user");

                // adding the user
                userRepository.delete(dbUser);
                userResponse.setResponseStatus(200);
                userResponse.setResponseDescription("User deleted successfully");
                userResponse.setUsers(dbUser);
                System.out.println(dbUser.getUserName() + " deleted successfully from the database");

            }
            else {
                System.out.println("The does not exist in the database");
                userResponse.setResponseStatus(400);
                userResponse.setResponseDescription("User not found");
                userResponse.setUsers(dbUser);
            }

        } catch (Exception preEx) {
            System.out.println("User didn't delete from the database");
            userResponse.setResponseStatus(400);
            userResponse.setResponseDescription("Deletion failed");
            userResponse.setUsers(dbUser);
            System.out.println(preEx.getCause());
            System.out.println(preEx.getMessage());
            preEx.printStackTrace();
        }
        return userResponse;
    }

    public UserResponse userLogin(Login login) {
        System.out.println("----- userLogin function is calling -----");
        // check whether the username available in the database
        try {
            dbUser = userRepository.findByUserEmail(login.getUserEmail());

            if (dbUser != null) {
                System.out.println("User found in the database");
                System.out.println("Therefore matching the password");

                if (dbUser.getUserPassword().equals(login.getUserPassword())) {
                    System.out.println("The passwords are matching");
                    userResponse.setResponseStatus(200);
                    userResponse.setResponseDescription("Login successfully");
                    userResponse.setUsers(dbUser);
                }

                else {
                    System.out.println("The passwords are not matching");
                    userResponse.setResponseStatus(400);
                    userResponse.setResponseDescription("Incorrect password");
                    userResponse.setUsers(null);
                }
            }
            else {
                System.out.println("User not found in the database");
                userResponse.setResponseStatus(400);
                userResponse.setResponseDescription("Incorrect email");
                userResponse.setUsers(dbUser);
            }

        } catch (Exception loginEx) {
            System.out.println("Login failed");
            userResponse.setResponseStatus(400);
            userResponse.setResponseDescription("Login failed");
            userResponse.setUsers(null);
            System.out.println(loginEx.getCause());
            System.out.println(loginEx.getMessage());
            loginEx.printStackTrace();
        }
        return userResponse;
    }
}
