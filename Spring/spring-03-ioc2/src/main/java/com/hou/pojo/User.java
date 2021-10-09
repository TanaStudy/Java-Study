package com.hou.pojo;

public class User {

    private String name;

    public User(String name) {
        this.name = name;
    }

    //    public User(){
//        System.out.println("new user");
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                '}';
    }
}
