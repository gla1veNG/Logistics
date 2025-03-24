import { Http } from 'basic'
import { AccountFormModel, UserInfoModel } from '../models/user'

//创建接口
export const loginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>('/login/account', data)
}

//获取用户信息接口
export const getUserInfoApi = (): Promise<UserInfoModel> => {
  return Http.get<UserInfoModel>('/users')
}