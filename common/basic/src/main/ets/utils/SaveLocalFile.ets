import { fileIo } from '@kit.CoreFileKit'
import { ImageListModel } from '../models'
import { request } from '@kit.BasicServicesKit'
import { uploadFile } from '../../../../Index'

export const SaveLocalFile = async (dataSoure: ImageListModel[]) => {
  //获取到存储的沙箱目录
  const saveDir = getContext().cacheDir

  //创建一个数组，保存上传的文件列表
  const fileParams: request.File[] = []

  dataSoure.forEach((item: ImageListModel) => {
    //图片的名称
    const imgName = Date.now() + '.jpg'

    //读取保存到沙箱的文件
    const file = fileIo.openSync(item.url, fileIo.OpenMode.READ_ONLY)

    //将相册文件拷贝到存储的沙箱文件
    fileIo.copyFileSync(file.fd, saveDir + '/' + imgName)

    //关闭文件数据读取
    fileIo.closeSync(file.fd)

    //将上传的每一个文件添加到fileParams中
    fileParams.push({
      filename: imgName,
      name: 'file',
      type: 'jpg',
      uri: `internal://cache/${imgName}`
    })
  })

  return await uploadFile(getContext(), fileParams)
}