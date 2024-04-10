package com.balance.beacon.backend.Models;

/**
 * model to bind user related responses to send back to the Mobile Application
 * if the request failed then the "responseStatus" will be 0, otherwise 1
 * if the request failed then the "responseDescription" will have the failed reason, otherwise null
 * if the request failed then the "users" object will be null, otherwise it contains the user details
 */
public class UserResponse {
    private int responseStatus;
    private String responseDescription;
    private Users users;

    public int getResponseStatus() {
        return responseStatus;
    }

    public void setResponseStatus(int responseStatus) {
        this.responseStatus = responseStatus;
    }

    public String getResponseDescription() {
        return responseDescription;
    }

    public void setResponseDescription(String responseDescription) {
        this.responseDescription = responseDescription;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
