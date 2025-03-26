@Component
struct TaskItemCard {
  build() {
    Column() {
      //任务编号
      Row() {
        Text('任务编号:23213213213213')
          .fontSize(16)
          .fontWeight(500)
          .lineHeight(22)
          .fontColor($r('app.color.text_primary'))

        Text('已延迟')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

      //地址
      Row() {
        Text('起')
          .width(22)
          .height(22)
          .backgroundColor($r('app.color.text_primary'))
          .fontColor($r('app.color.white'))
          .borderRadius(11)
          .textAlign(TextAlign.Center)
          .fontSize(12)

        Text('广东省东莞市asdasdddddddddddddddddddddddddddddd')
          .fontSize(14)
          .margin({ left: 12 })
          .fontColor($r('app.color.text_primary'))
      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .margin({ top: 20 })


      Row() {
        Text('止')
          .width(22)
          .height(22)
          .backgroundColor($r('app.color.primary'))
          .fontColor($r('app.color.white'))
          .borderRadius(11)
          .textAlign(TextAlign.Center)
          .fontSize(12)

        Text('广东省东莞市as')
          .fontSize(14)
          .margin({ left: 12 })
          .fontColor($r('app.color.text_primary'))
      }
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .margin({ top: 20 })


      Divider()
        .strokeWidth(1)
        .color($r('app.color.background_divider'))
        .margin({ top: 20, bottom: 20 })

      //提货
      Row() {
        Column({ space: 5 }) {
          Text('提货时间')
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
          Text('2025.03.26 15：38')
            .fontSize(14)
            .fontColor($r('app.color.text_primary'))
        }
        .alignItems(HorizontalAlign.Start)

        Button('提货', { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary'))
          .fontSize(14)
          .fontColor($r('app.color.white'))
          .height(32)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .backgroundColor($r('app.color.white'))
    .borderRadius(10)
    .padding(20)
  }
}

export default TaskItemCard