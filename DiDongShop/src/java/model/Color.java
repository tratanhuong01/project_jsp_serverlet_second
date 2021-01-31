package model;

public class Color {
    private String idColor;
    private String nameColor;
    private String codeColor;

    public Color(String idColor, String nameColor, String codeColor) {
        this.idColor = idColor;
        this.nameColor = nameColor;
        this.codeColor = codeColor;
    }

    public String getIdColor() {
        return idColor;
    }

    public void setIdColor(String idColor) {
        this.idColor = idColor;
    }

    public String getNameColor() {
        return nameColor;
    }

    public void setNameColor(String nameColor) {
        this.nameColor = nameColor;
    }

    public String getCodeColor() {
        return codeColor;
    }

    public void setCodeColor(String codeColor) {
        this.codeColor = codeColor;
    }
    
}
