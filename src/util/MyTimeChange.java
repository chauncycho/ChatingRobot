package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;
import java.util.logging.SimpleFormatter;

public class MyTimeChange {
    public static String changeTime(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        return sdf.format(date);
    }

//    测试
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(changeTime(date));
    }
}
