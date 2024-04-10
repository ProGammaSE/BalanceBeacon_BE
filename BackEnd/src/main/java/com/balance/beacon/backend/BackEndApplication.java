package com.balance.beacon.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@SpringBootApplication
public class BackEndApplication {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306";
        String username = "root";
        String password = "";

        System.out.println("Connecting to database...");

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            System.out.println("Server connected!");
            SpringApplication.run(BackEndApplication.class, args);
        } catch (Exception exception) {
            System.out.println("Cannot connect to database!");
            System.out.println(exception.getCause());
        }
    }
}
