import { request } from '@kit.BasicServicesKit'
import { BASE_URL, ImageListModel, ResponseDataModel, UserSettingClass } from '../../../../Index'

export const uploadFile = async (context: Context, fileParams: request.File[]) => {
  //获取token
  const setting = new UserSettingClass(context)

  const token = setting.getUserToken()

  const config: request.UploadConfig = {
    //请求的接口
    url: BASE_URL + '/files/upload',
    //请求的方式
    method: 'POST',
    header: {
      Authorization: token
    },
    data: [],
    files: fileParams
  }

  //发送文件上传请求
  const task = await request.uploadFile(context, config)

  return new Promise<ImageListModel[]>((resolve, reject) => {
    try {
      //保存上传的文件地址
      const arr: ImageListModel[] = []
      //监听文件上传成功
      task.on('headerReceive', (headers: object) => {
        if (headers['body']) {
          const result = JSON.parse(headers['body']) as ResponseDataModel

          if (result.code === 200) {
            arr.push({
              url: result.data,
            })
          }
        }
      })
      //监听文件上传失败
      task.on('fail', () => {
        reject(new Error('上传失败'))
      })
      //监听文件上传，不管成功或者失败
      task.on('complete', () => {
        resolve(arr)
      })

    } catch (e) {
      console.log('error', e)
    }

  })
}