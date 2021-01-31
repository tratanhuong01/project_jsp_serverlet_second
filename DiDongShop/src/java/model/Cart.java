package model;

public class Cart {
    private int idCart;
    private String idProductBought;
    private String idUSers;
    private int amount;

    public Cart(int idCart, String idProductBought, String idUSers, int amount) {
        this.idCart = idCart;
        this.idProductBought = idProductBought;
        this.idUSers = idUSers;
        this.amount = amount;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public String getIdProductBought() {
        return idProductBought;
    }

    public void setIdProductBought(String idProductBought) {
        this.idProductBought = idProductBought;
    }

    public String getIdUSers() {
        return idUSers;
    }

    public void setIdUSers(String idUSers) {
        this.idUSers = idUSers;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

     
}
