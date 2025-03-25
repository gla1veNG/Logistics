@Entry
@Component
struct Setting {
  @State message: string = 'Hello World';

  build() {
    Column() {

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}