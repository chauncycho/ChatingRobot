package util;

import java.io.*;

public class WriteLog {
    public static void WriteLogForUser(String path, String userid, String name, String info, String time){

//        生成文件夹
        File folder = new File(path + "/WEB-INF/logs1.9");
        if(!folder.exists()){
            folder.mkdir();
        }

//        生成日志文件
        File file = new File(path + "/WEB-INF/logs1.9/"+userid+".txt");
        if(!file.exists()){
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//        写日志
        try {
            FileOutputStream fos = new FileOutputStream(file,true);
            String text = name + "在" + time + "说了：" + info+"\n";
            byte[] b = text.getBytes("UTF-8");
            fos.write(b);
            fos.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void WriteLoginLog(String path, String userid, String time){
        File folder = new File(path + "/WEB-INF/loginLog1.9");
        if(!folder.exists()){
            folder.mkdir();
        }
        File file = new File(path + "/WEB-INF/loginLog1.9/LoginLog.txt");
        if(!file.exists()){
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try {
            FileOutputStream fos = new FileOutputStream(file,true);
            String text = userid +" 在 " + time + " 登录\n";
            byte[] b = text.getBytes("UTF-8");
            fos.write(b);
            fos.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
