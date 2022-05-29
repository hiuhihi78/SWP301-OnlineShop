/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.TreeMap;

/**
 *
 * @author Admin
 *
 */
public class Role {

    private int id;
    private String name;
    private boolean active;
    private LinkedHashMap<Feature, Boolean> allowFeatures;

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

    public LinkedHashMap<Feature, Boolean> getAllowFeatures() {
        return allowFeatures;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setAllowFeatures(LinkedHashMap<Feature, Boolean> allowFeatures) {
        this.allowFeatures = allowFeatures;
    }
}
