package cn.qas.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

  private int userId;
  private String userName;
  private String userNick;
  private String userPassword;
  private int userStatus;
  private int userType;
  private Date userRegTime;
  private Date userLastLoginTime;
  private Date userModifyTime;

}
