package model;

public class Product {
    private String idProduct;
    private String idGProduct;
    private String idColor;
    private String memory;
    private int costProduct;
    private float costSale;
    private String imageProduct;
    private int state;
    private String nameProduct;
    private String moTa_1;
    private String moTa_2;
    
    public Product(String idProduct, String idGProduct, String idColor, String memory, 
            int costProduct, float costSale, String imageProduct, int state, String nameProduct, String moTa_1, String moTa_2) {
        this.idProduct = idProduct;
        this.idGProduct = idGProduct;
        this.idColor = idColor;
        this.memory = memory;
        this.costProduct = costProduct;
        this.costSale = costSale;
        this.imageProduct = imageProduct;
        this.state = state;
        this.nameProduct = nameProduct;
        this.moTa_1 = moTa_1;
        this.moTa_2 = moTa_2;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getIdGProduct() {
        return idGProduct;
    }

    public void setIdGProduct(String idGProduct) {
        this.idGProduct = idGProduct;
    }

    public String getIdColor() {
        return idColor;
    }

    public void setIdColor(String idColor) {
        this.idColor = idColor;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public int getCostProduct() {
        return costProduct;
    }

    public void setCostProduct(int costProduct) {
        this.costProduct = costProduct;
    }

    public float getCostSale() {
        return costSale;
    }

    public void setCostSale(float costSale) {
        this.costSale = costSale;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getMoTa_1() {
        return moTa_1;
    }

    public void setMoTa_1(String moTa_1) {
        this.moTa_1 = moTa_1;
    }

    public String getMoTa_2() {
        return moTa_2;
    }

    public void setMoTa_2(String moTa_2) {
        this.moTa_2 = moTa_2;
    }
    
}
