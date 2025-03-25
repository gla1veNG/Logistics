import { router } from '@kit.ArkUI';

@Entry
@Component
struct Setting {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Stack({ alignContent: Alignment.Start }) {
        Row() {
          Text('系统设置')
            .fontColor($r('app.color.text_primary'))
            .fontSize(18)
            .fontWeight(600)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)

        Image($r('app.media.ic_btn_nav_back'))
          .width(44)
          .aspectRatio(1)
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
      .height(50)
      .padding(10)
      .backgroundColor($r('app.color.white'))
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}