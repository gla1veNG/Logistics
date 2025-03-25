//登录接口的请求参数类型
export interface AccountFormModel {
  account: string
  password: string
}

//用户接口返回的数据类型
export interface UserInfoModel {
  //头像
  avatar: ResourceStr;

  //姓名
  name: string;

  //司机编号
  number: string;

  //手机号
  phone: string;
}

