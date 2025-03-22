import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { BASE_URL } from '../constants';

const service = axios.create({
  baseURL: BASE_URL,
  timeout: 10000
})

// 添加请求拦截器
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  return config;
}, (error: AxiosError) => {

  return Promise.reject(error);
});


service.interceptors.response.use((response: AxiosResponse) => {
  if (response.status === 200) {
    return response.data.data;
  }
}, (error: AxiosError) => {
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