package StringUtil;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class StringCheck {
    public static String[] splitString(String text) {
        return text.split(",");
    }
    
    public static String Check(String text) {
        return text == null ? "" : text;
    }
    public static String CheckN(String text) {
        return text == null ? null : text;
    }
    public static boolean checkEmail(String s)
    {
        String regexName = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
    + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        return s.matches(regexName);
    }
    public static boolean checkNumberPhone(String s)
    {
        String regexName = "^\\+?(?:0|84)(?:\\d){9}$";
        return s.matches(regexName);
    }
    public static boolean kiemTra(String s)
    {
        String regexName = "^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
        "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
        "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
        return s.matches(regexName);
    }
    public static String convertMoney(int money) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        return formatter.format(Long.parseLong(String.valueOf(money))) + "   . VNĐ";
    }
    public static void main(String args[]) {
        
    }
}
