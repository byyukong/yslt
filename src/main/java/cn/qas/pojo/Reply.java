package cn.qas.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

  private User user; // 用户
  private Tip tip; // 贴子

  private String user_id; // 回复用户的id
  private int tip_id; // 被回复的贴子id

  private int reply_id; // 回复id
  private String reply_content; // 回复内容
  private Date reply_publishTime; // 回复发表时间
  private Date reply_modifyTime; // 回复修改时间
  // private int reply_status; // 回复状态
  private int reply_isDeleted; // 是否删除，0-否，1-是


}
