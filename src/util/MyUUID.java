package util;

import java.util.UUID;

public class MyUUID {
    public static String myGetRandomUUID(){
        String myUuid = UUID.randomUUID().toString().replace("-","");
        return myUuid;
    }

    public static void main(String[] args) {
        System.out.println(myGetRandomUUID());
    }
}
