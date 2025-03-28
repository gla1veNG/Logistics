import { TaskListItemDataModel, TaskTypeEnum } from '../../../models/task'
import router from '@ohos.router'

@Component
struct TaskItemCard {
  @Prop
  taskItem: TaskListItemDataModel = {} as TaskListItemDataModel

  toPickUp() {
    router.pushUrl({
      url: 'pages/TasjDetail/TaskDetail',
      params: { id: this.taskItem.id }
    })
  }

  build() {
    Column() {
      //任务编号
      Row() {
        Text(`任务编号:${this.taskItem.transportTaskId}`)
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

        Text(this.taskItem.startAddress)
          .fontSize(14)
          .margin({ left: 12 })
          .fontColor($r('app.color.text_primary'))
      }
      .alignItems(VerticalAlign.Center)
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

        Text(this.taskItem.endAddress)
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
          Text(this.taskItem.planDepartureTime)
            .fontSize(14)
            .fontColor($r('app.color.text_primary'))
        }
        .alignItems(HorizontalAlign.Start)

        if (this.taskItem.status === TaskTypeEnum.Waiting) {
          Button('提货', { type: ButtonType.Capsule })
            .backgroundColor(this.taskItem.enablePickUp ? $r('app.color.primary') : $r('app.color.primary_disabled'))
            .fontSize(14)
            .fontColor($r('app.color.white'))
            .height(32)
            .enabled(this.taskItem.enablePickUp)
        } else if (this.taskItem.status === TaskTypeEnum.Line) {
          Button('交货', { type: ButtonType.Capsule })
            .backgroundColor($r('app.color.primary'))
            .fontSize(14)
            .fontColor($r('app.color.white'))
            .height(32)
        }

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .backgroundColor($r('app.color.white'))
    .borderRadius(10)
    .padding(20)
    .onClick(() => {
      this.toPickUp()
    })
  }
}

export default TaskItemCard