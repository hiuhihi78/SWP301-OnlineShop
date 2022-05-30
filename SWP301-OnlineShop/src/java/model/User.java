/*
<<<<<<< HEAD
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
=======
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
>>>>>>> f4f075f799f029540ea5d1414d5fab636d36beb1
 */
package model;

    
public class User {

    private int id;
    private String password;
    private String avatar;
    private String fullname;
    private boolean gender;
    private String mobile;
    private String address;
    private boolean status;
    private Role role;
    private String email;

    public User() {
    }

    
    
    public User(String password, String avatar, String email, String fullname, boolean gender, String mobile, String address, boolean status) {
        this.password = password;
        this.avatar = avatar;
        this.email = email;
        this.fullname = fullname;
        this.gender = gender;
        this.mobile = mobile;
        this.address = address;
        this.status = status;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", password=" + password + ", avatar=" + avatar + ", email=" + email + ", fullname=" + fullname + ", gender=" + gender + ", mobile=" + mobile + ", address=" + address + ", status=" + status + ", role=" + role + '}';
    }
    
}
