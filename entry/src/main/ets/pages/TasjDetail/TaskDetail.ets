import { router } from '@kit.ArkUI';
import { BaseBuilderClass, INavBar, IToggleCard, IUpload, RouterParamsModel } from 'basic';
import { getTaskDetailInfoApi } from '../../api/taskDetail';
import { TaskDetailInfoModel } from '../../models';

@Entry
@Component
struct TaskDetail {
  @State params: RouterParamsModel = {} as RouterParamsModel
  @State taskDetailInfo: TaskDetailInfoModel = {} as TaskDetailInfoModel

  aboutToAppear(): void {
    this.getParamsData()
    this.getTaskDetailInfo()
  }

  //获取任务页面传递过来的司机ID
  getParamsData() {
    this.params = router.getParams() as RouterParamsModel
  }

  //获取任务详情页数据
  async getTaskDetailInfo() {
    try {
      this.taskDetailInfo = await getTaskDetailInfoApi(this.params.id)
    } catch (e) {
      console.log('error', e)
    }

  }

  @Builder
  getBaseContentItem(item: BaseBuilderClass) {
    Row() {
      Text(item.title)
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .lineHeight(20)

      Row() {
        Text(item.value)
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
        if (item.icon) {
          Image(item.icon)
            .width(24)
            .height(24)
        }
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .margin({ top: 15 })
  }

  //基本信息
  @Builder
  getBaseContent() {
    Row() {
      Column() {
        Row() {
          Text('起')
            .baseTextIconStyle()
          Text(this.taskDetailInfo.startAddress)
            .baseTextstyle()
        }
        .margin({ top: 21 })


        Row() {
          Text('止')
            .baseTextIconStyle()
            .backgroundColor($r('app.color.primary'))
          Text(this.taskDetailInfo.endAddress)
            .baseTextstyle()
        }
        .margin({ top: 15 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ right: 20 })

      Column() {
        Image($r('app.media.ic_navigation'))
          .width(20)
        Text('开始导航')
          .fontSize(14)
          .margin({ top: 20 })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 20 })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .width('100%')

    Divider()
      .vertical(false)
      .height(2)
      .color($r('app.color.background_divider'))
      .margin({ left: 8, right: 8, top: 21 })

    this.getBaseContentItem({
      title: '任务编号',
      value: this.taskDetailInfo.transportTaskId
    })
    this.getBaseContentItem({
      title: '联系人',
      value: this.taskDetailInfo.startHandoverName
    })
    this.getBaseContentItem({
      title: '联系电话',
      value: this.taskDetailInfo.startHandoverPhone,
      icon: $r('app.media.ic_phone'),
    })
    this.getBaseContentItem({
      title: '提货时间',
      value: this.taskDetailInfo.planDepartureTime
    })
    this.getBaseContentItem({
      title: '预计送达时间',
      value: this.taskDetailInfo.planArrivalTime
    })

  }

  //车辆司机信息
  @Builder
  getDriverContent() {
    this.getBaseContentItem({
      title: '车牌号',
      value: this.taskDetailInfo.licensePlate
    })

    this.getBaseContentItem({
      title: '司机姓名',
      value: this.taskDetailInfo.driverName
    })
  }

  // 运输路线
  @Builder
  getTransLineContent() {
    Row() {
      Column() {
        Text(this.taskDetailInfo.startProvince)
          .fontSize(16)
          .fontColor($r('app.color.text_primary'))
          .lineHeight(22)
          .fontWeight(600)
        Text(this.taskDetailInfo.startCity)
          .fontSize(14)
          .lineHeight(22)
      }
      .width(50)

      Image($r("app.media.ic_right_arrow"))
        .width(36)
        .height(16)
      Column() {
        Text(this.taskDetailInfo.endProvince)
          .fontSize(16)
          .fontColor($r('app.color.text_primary'))
          .lineHeight(22)
          .fontWeight(600)
        Text(this.taskDetailInfo.endCity)
          .fontSize(14)
          .lineHeight(22)
      }.width(50)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .padding({
      top: 20,
      bottom: 20,
      left: 60,
      right: 60
    })
  }

  build() {

    Column() {
      INavBar({
        title: '任务详情',
        rightText: '取消任务'
      })
      Scroll() {
        Column() {
          IToggleCard({ title: '基本信息' }) {
            this.getBaseContent()
          }

          IToggleCard({ title: '车辆司机信息', toggleCard: false }) {
            this.getDriverContent()
          }

          IToggleCard({ title: '运输路线', toggleCard: false }) {
            this.getTransLineContent()
          }

          IToggleCard({ title: '物品信息', toggleCard: false })
          IToggleCard({ title: '提货信息', toggleCard: false }) {
            IUpload({ title: '请拍照上传回单凭证' })
            IUpload({ title: '请拍照上传货品照片' })
          }
        }

        .padding({ bottom: 50 })
      }
      .width('100%')
      .backgroundColor($r('app.color.background_page'))
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}

@Extend(Text)
function baseTextIconStyle() {
  .fontSize(12)
  .fontColor($r('app.color.white'))
  .width(22)
  .backgroundColor($r('app.color.text_primary'))
  .height(22)
  .borderRadius(11)
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function baseTextstyle() {
  .margin({ left: 11.5 })
  .fontColor($r('app.color.text_secondary'))
  .fontSize(14)
  .lineHeight(20)
}

