import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { UserSettingClass } from '.';
import { BASE_URL } from '../constants';
import { promptAction, router } from '@kit.ArkUI';

const service = axios.create({
  baseURL: BASE_URL,
  timeout: 10000
})

// 添加请求拦截器
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {

  //token 本地首先项当中
  const setting = new UserSettingClass(getContext())
  //获取 token
  const token = setting.getUserToken()
  //如果token存在
  if (token) {
    //将token通过请求头发送给后台
    config.headers.Authorization = token
  }

  return config;
}, (error: AxiosError) => {

  return Promise.reject(error);
});


service.interceptors.response.use((response: AxiosResponse) => {
  //如果状态码是200，并且业务码也是200，再返回数据的时候，直接将需要的数据从data.data中获取出来
  if (response.status === 200 && response.data.code === 200) {
    return response.data.data;
  }
}, (error: AxiosError) => {
if(error.response?.status === 401){
  promptAction.showToast({message:'登录超时'})
  //删除原来token
  const setting = new UserSettingClass(getContext())
  setting.deleteUserToken()

  //重新登录
  router.replaceUrl({
    url:'pages/Login/Login'
  })
}
  return Promise.reject(error);
});

class Http {
  static get<T>(url: string, params?: object) {
    return service.get<null, T>(url, { params })
  }

  static post<T>(url: string, data?: object) {
    return service.post<null, T>(url, data)

  }

  static put<T>(url: string, data?: object) {
    return service.put<null, T>(url, data)

  }

  delete<T>(url: string, data?: object) {
    return service.delete<null, T>(url, data)

  }
}

export { Http }