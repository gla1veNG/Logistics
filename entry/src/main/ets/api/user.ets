import { Http } from 'basic'
import { AccountFormModel, UserInfoModel, UserTaskInfoModel, UserTaskInfoParamsModel } from '../models'


//创建接口
export const loginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>('/login/account', data)
}

//获取用户信息接口
export const getUserInfoApi = (): Promise<UserInfoModel> => {
  return Http.get<UserInfoModel>('/users')
}

//获取任务数据接口
export const getUserTaskInfoApi = (params: UserTaskInfoParamsModel): Promise<UserTaskInfoModel> => {
  return Http.get<UserTaskInfoModel>('/users/taskReport', params);
}