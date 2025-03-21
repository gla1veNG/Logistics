@Entry
@Component
struct Start {
  build() {
    Stack({alignContent:Alignment.TopEnd}) {
      Image($r("app.media.start"))
        .objectFit(ImageFit.Cover)

      Text('5秒跳过')
        .padding({left:10,right:10})
        .margin({top:20,right:20})
        .height(30)
        .fontSize(14)
        .borderRadius(15)
        .textAlign(TextAlign.Center)
        .backgroundColor($r("app.color.background_page"))
    }

  }
}