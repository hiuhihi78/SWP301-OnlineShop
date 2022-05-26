/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class Role {
    private int id;
    private String name;
    private boolean active;
    private HashMap<Feature, Boolean> allowFeatures;

    public Role(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Role(int id) {
        this.id = id;
    }

    public Role() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return active;
    }

    public void setStatus(boolean active) {
        this.active = active;
    }

    public HashMap<Feature, Boolean> getAllowFeatures() {
        return allowFeatures;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setAllowFeatures(HashMap<Feature, Boolean> allowFeatures) {
        this.allowFeatures = allowFeatures;
    }
    
}
