package cn.qas.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author LiSheng
 * @create 2020-06-19 23:43
 * 通用的返回类
 */
public class Msg {

    //100成功  200失败
    private int code;

    //成功或失败 的提示信息
    private String msg;

    //用户要返回给浏览器的数据
    private Map<String,Object> extend=new HashMap<String,Object>();

    //成功调用的方法
    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMsg("成功!");
        return msg;
    }

    //失败调用的方法
    public static Msg  fail(){
        Msg  msg = new Msg();
        msg.setCode(200);
        msg.setMsg("失败!");
        return msg;
    }

    //添加数据
    public Msg  add(String key, Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }


}
