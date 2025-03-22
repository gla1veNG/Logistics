import { Http } from 'basic'
import { AccountFormModel } from '../models/user'

//创建接口
export const loginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>("1111", data)
}