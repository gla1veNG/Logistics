import { INavBar } from 'basic';

@Entry
@Component
struct Setting {
  build() {
    Column() {
      INavBar({ title: 'textetxtetx' })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}