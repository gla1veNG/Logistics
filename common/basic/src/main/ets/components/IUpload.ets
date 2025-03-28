import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { IPreview } from '../../../../Index';
import { ImageListModel } from '../models';

@Component
export struct IUpload {
  @Prop title: string = ''
  @Prop maxNumber: number = 3
  //保存上传的图片
  @Prop imageList: ImageListModel[] = []
  @State index: number = 0
  customDialogController: CustomDialogController = new CustomDialogController({
    builder: IPreview({
      url: this.imageList.map((item: ImageListModel) => item.url),
      selectIndex: this.index
    }),
    customStyle: true
  })
  onImageListChange: (imageList: ImageListModel[]) => void = () => {
  }

  //弹出系统相册
  async selectImage() {
    //创建图库选择器实例
    const photoViewPicker = new photoAccessHelper.PhotoViewPicker();
    //打开系统相册
    const result = await photoViewPicker.select({
      MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE, //限制只能选择图片
      maxSelectNumber: this.maxNumber - this.imageList.length, //限制最大上传内容数量
    })
    //将选择的图片保存到imageList
    const data = result.photoUris.map((item: string) => {
      return { url: item } as ImageListModel
    })
    this.imageList.push(...data)
    this.onImageListChange(this.imageList)
  }

  build() {
    Column() {
      Text(this.title)
        .fontSize(14)
        .fontWeight(400)
        .fontColor($r('app.color.text_secondary'))
        .margin({ top: 16, bottom: 16 })

      Grid() {
        ForEach(this.imageList, (item: ImageListModel, index: number) => {
          GridItem() {
            Stack({ alignContent: Alignment.TopEnd }) {
              Image(item.url)
                .width(95)
                .height(95)
                .borderRadius(5)
                .onClick(() => {
                  this.customDialogController.open()
                  this.index = index
                })

              Image($r('app.media.ic_btn_delete'))
                .width(30)
                .height(30)
                .onClick(() => {
                  this.imageList.splice(index, 1)
                  this.onImageListChange(this.imageList)
                })
            }
          }
        })
        if (this.imageList?.length < 3) {
          GridItem() {
            Row() {

              Image($r('app.media.ic_add_img'))
                .width(30)
                .height(30)
            }
            .justifyContent(FlexAlign.Center)
            .width(95)
            .height(95)
            .backgroundColor('#f2f2f2')
            .onClick(() => {
              this.selectImage()
            })
          }
        }

      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)

    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}


