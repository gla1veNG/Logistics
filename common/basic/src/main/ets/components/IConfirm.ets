import { CustomDialogModel } from '../models'

@CustomDialog
@Component
export struct IConfirm {
  controller: CustomDialogController
  message: string = '确定要退出登录吗'
  buttonList: CustomDialogModel[] = [{ text: '取消' }]

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.message)
            .fontSize(16)
            .fontWeight(600)
            .fontColor($r('app.color.text_primary'))
        }
        .width('100%')
        .height(88)
        .justifyContent(FlexAlign.Center)
        .border({ width: { bottom: 1 }, color: $r('app.color.background_divider') })

        Row() {
          ForEach(this.buttonList, (item: CustomDialogModel, index: number) => {
            Text(item.text)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .layoutWeight(1)
              .fontColor(item.fonColor || $r('app.color.text_secondary'))
              .height('100%')
              .border({
                width: { right: this.buttonList.length > 1 && index !== this.buttonList.length - 1 ? 1 : 0 },
                color: $r('app.color.background_divider')
              })
              .onClick(() => {
                if (item.action) {
                  item.action()
                }
                this.controller.close()
              })
          })
        }
        .width('100%')
        .height(49)
      }
      .width('100%')
      .backgroundColor($r('app.color.white'))
      .borderRadius(12)
    }
    .width('100%')
    .padding({ left: 25, right: 25 })
  }
}