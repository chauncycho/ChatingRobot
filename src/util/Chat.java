package util;

import net.sf.json.JSONObject;
import net.sf.json.JSONString;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class Chat {
    public static String sendMessage(String key, String info, String userid){
//        返回信息
        String returnMessage = null;

        try {
//            创建用户对象
            CloseableHttpClient httpClient = HttpClients.createDefault();
//            创建Post对象
            HttpPost httpPost = new HttpPost("http://www.tuling123.com/openapi/api?key="+key+
                    "&info="+info+"&userid="+userid);
            httpPost.setEntity(new StringEntity("no message"));

//            处理response
            ResponseHandler<String> responseHandler = response -> {
                int status = response.getStatusLine().getStatusCode();
                if ( status >= 200 && status < 300){
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity) : null ;
                }else{
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            };

//            得到网站返回信息
            String responseBody = httpClient.execute(httpPost,responseHandler);
//            通过json对象获取其中信息
            JSONObject jsonReponseBody = JSONObject.fromObject(responseBody);

//            可进行扩展
//            {"code":100000,"text":"哎呀，小主人好有礼貌啊。"}

//            直接传回json数据，前端处理json
            returnMessage = jsonReponseBody.toString();



        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return returnMessage;
    }

    public static String sendMessageV2(String key, String info, String userid){
        String returnMessage = null;
        String jsonString = "{\"perception\":{\"inputText\":{\"text\":\"哈哈哈\"}},\"userInfo\":{\"apiKey\":\"a158a70b469f41fc85af46bafd0b8f84\",\"userId\":\"123456789\"}}";
        JSONObject jsonObject = JSONObject.fromObject(jsonString);

        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost("http://openapi.tuling123.com/openapi/api/v2");
            httpPost.setEntity(new StringEntity(jsonObject.toString()));

            ResponseHandler<String> responseHandler = response -> {
                int status = response.getStatusLine().getStatusCode();
                if ( status >= 200 && status < 300){
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity) : null ;
                }else{
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            };

            String responseBody = httpClient.execute(httpPost,responseHandler);
            returnMessage = responseBody;

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return returnMessage;
    }

//    测试
    public static void main(String[] args) {
//        http://www.tuling123.com/openapi/api?key=914d01df3d46466e8cf3178a2dcb4da6&info=我想看照片&userid=123456
        System.out.println(sendMessage("914d01df3d46466e8cf3178a2dcb4da6","你好","123456"));
//        System.out.println(sendMessageV2("1","1","1"));
    }
}
