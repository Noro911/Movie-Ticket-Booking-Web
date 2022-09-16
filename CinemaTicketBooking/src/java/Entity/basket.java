/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

public class basket {
    private String id, user;
    private String name, location, date, time;
    private int cost, quantity, total;
    private String img;

    public basket() {
    }

    public basket(String id, String name, String location, String date, String time, int cost, int quantity) {
        this.id=id;
        this.name = name;
        this.location = location;
        this.date = date;
        this.time = time;
        this.cost = cost;
        this.quantity=quantity;
    }
    
    public basket(String id, String user, String name, String location, String date, String time, int cost, int quantity) {
        this.id=id;
        this.user=user;
        this.name = name;
        this.location = location;
        this.date = date;
        this.time = time;
        this.cost = cost;
        this.quantity=quantity;
    }
    
    public basket(String id, String user, String name, String location, String date, String time, int cost, int quantity, String img) {
        this.id=id;
        this.user=user;
        this.name = name;
        this.location = location;
        this.date = date;
        this.time = time;
        this.cost = cost;
        this.quantity=quantity;
        this.img=img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getTotal() {
        return quantity*cost;
    }

    @Override
    public String toString() {
        return "basket{" + "id=" + id + ", user=" + user + ", name=" + name + ", location=" + location + ", date=" + date + ", time=" + time + ", cost=" + cost + ", quantity=" + quantity + ", total=" + getTotal() + ", img=" + img + '}';
    }

    

    
    
}
