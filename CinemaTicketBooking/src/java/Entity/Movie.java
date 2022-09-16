/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author USER
 */
public class Movie {
    private String id, name;
    private int cost;
    private String length, syn, img, poster ;

    public Movie() {
    }

    public Movie(String id, String name, int cost, String length, String syn, String img, String poster) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.length = length;
        this.syn = syn;
        this.img = img;
        this.poster= poster;
    }
    
    public Movie(String name, String length, String syn, String img) {
        this.name = name;
        this.length = length;
        this.syn = syn;
        this.img = img;
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

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getSyn() {
        return syn;
    }

    public void setSyn(String syn) {
        this.syn = syn;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    @Override
    public String toString() {
        return "Movie{" + "id=" + id + ", name=" + name + ", cost=" + cost + ", length=" + length + ", syn=" + syn + ", img=" + img + '}';
    }
    
    
}
