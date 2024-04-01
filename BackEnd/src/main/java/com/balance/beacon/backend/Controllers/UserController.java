package com.balance.beacon.backend.Controllers;

import com.balance.beacon.backend.Models.Login;
import com.balance.beacon.backend.Models.UserResponse;
import com.balance.beacon.backend.Models.Users;
import com.balance.beacon.backend.Services.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {

    private final UserService userService;

    // constructor
    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * function to register user in the database
     * @return createUser
     */
    @PostMapping(value = "/user/register")
    private UserResponse registerUser(@RequestBody Users user) {
        return userService.registerUser(user);
    }

    /**
     * function to delete a user from the database by passing the email address
     * @return deleteUser
     */
    @DeleteMapping(value = "/user/delete/{userEmail}")
    private UserResponse deleteUser(@PathVariable String userEmail) {
        return userService.deleteUser(userEmail);
    }

    /**
     * function to handle user logins by checking the email and the password
     */
    @PostMapping(value = "/user/login")
    private UserResponse userLogin(@RequestBody Login login) {
        return userService.userLogin(login);
    }
}
