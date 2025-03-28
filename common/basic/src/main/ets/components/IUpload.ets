@Component
export struct IUpload {
  @Prop title: string = ''

  build() {
    Column() {
      Text(this.title)
        .fontSize(14)
        .fontWeight(400)
        .fontColor($r('app.color.text_secondary'))
        .margin({ top: 16, bottom: 16 })

      Row() {
        Image($r('app.media.ic_add_img'))
          .width(30)
          .height(30)
      }
      .justifyContent(FlexAlign.Center)
      .width(95)
      .height(95)
      .backgroundColor('#f2f2f2')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}