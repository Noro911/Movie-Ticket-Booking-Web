/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author USER
 */
public class User {
    private String id;
    private String name ;
    private String username ;
    private String pass;
    private String role;

    public User() {
    }

    public User(String id, String name, String username, String pass, String role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.pass = pass;
        this.role=role;
    }
    
    public User(String id, String name, String username, String role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.role=role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", username=" + username + ", pass=" + pass + '}';
    }
    
    
}
