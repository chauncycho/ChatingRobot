package util;

import java.util.Date;
import java.util.List;

public class User {
//    User:
//String name
//String passwd
//String id
//Date createTime
//Date lastTimeLog
//List<Message>

    private String userName;
    private String password;
    private String id;
    private Date createTime;
    private Date lastTimeLog;
    private String messagesPath;

    public User(String userName, String password, String id){
        this.userName = userName;
        this.password = password;
        this.id = id;
        this.createTime = new Date();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getLastTimeLog() {
        return lastTimeLog;
    }

    public void setLastTimeLog(Date lastTimeLog) {
        this.lastTimeLog = lastTimeLog;
    }

    public String getMessagesPath() {
        return messagesPath;
    }

    public void setMessagesPath(String messagesPath) {
        this.messagesPath = messagesPath;
    }
}
