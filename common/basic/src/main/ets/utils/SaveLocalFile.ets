import { fileIo } from '@kit.CoreFileKit'
import { ImageListModel } from '../models'

export const SaveLocalFile = (dataSoure: ImageListModel[]) => {
  //获取存储的沙箱目录
  const saveDir = getContext().filesDir

  dataSoure.forEach((item: ImageListModel) => {
    //图片的名称
    const imgName = Date.now()

    //读取保存到沙箱的文件
    const file = fileIo.openSync(item.url, fileIo.OpenMode.READ_ONLY)

    //将相册文件拷贝到存储的沙箱文件
    fileIo.copyFileSync(file.fd, saveDir + '/' + imgName + '.jpg')

    //关闭文件数据读取
    fileIo.close(file.fd)
  })
}