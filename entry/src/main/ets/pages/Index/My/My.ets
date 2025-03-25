import { ICard, ICardItem } from 'basic'
import { getUserInfoApi } from '../../../api'
import { UserInfoModel } from '../../../models'

@Component
struct My {
  //用于保存获取到的用户信息
  @State userInfo: UserInfoModel = {} as UserInfoModel
  @Consume
  @Watch('getUserInfo')
  currentName:string

  //调用获取用户信息接口
  // aboutToAppear(): void {
  //   this.getUserInfo()
  // }

  //获取用户信息方法
  async getUserInfo() {
    try {
      this.userInfo = await getUserInfoApi()
    } catch (e) {
      console.log('error', e)
    }
  }

  build() {
    Column() {
      //用户信息
      Column() {
        Image(this.userInfo?.avatar)
          .width(67)
          .height(67)
          .borderRadius(33.5)

        Text(this.userInfo?.name)
          .fontSize(18)
          .fontWeight(600)
          .lineHeight(25)
          .margin({ top: 9, bottom: 9 })
          .fontColor($r('app.color.white'))

        Text(`司机编号：${this.userInfo?.number}`)
          .fontSize(14)
          .fontWeight(400)
          .lineHeight(20)
          .fontColor($r('app.color.white'))

        Text(`手机号：${this.userInfo?.phone}`)
          .fontSize(14)
          .fontWeight(400)
          .lineHeight(20)
          .margin({ top: 10 })
          .fontColor($r('app.color.white'))

      }
      .backgroundImage($r('app.media.bg_page_my'))
      .height(290)
      .width('100%')
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      //本月任务
      Column() {
        Text('- 本月任务 -')
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
          .lineHeight(20)

        Row() {
          Column() {
            Text('18')
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })

            Text('任务总量')
              .fontSize(12)
              .fontColor($r('app.color.text_primary'))
          }

          Column() {
            Text('16')
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })

            Text('完成任务量')
              .fontSize(12)
              .fontColor($r('app.color.text_primary'))
          }

          Column() {
            Text('3987')
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })

            Text('运输里程(Km)')
              .fontSize(12)
              .fontColor($r('app.color.text_primary'))
          }
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('100%')
        .layoutWeight(1)

      }
      .backgroundColor($r('app.color.white'))
      .borderRadius(8)
      .height(134)
      .padding({ top: 14, bottom: 14 })
      .margin({
        top: -50,
        bottom: 15,
        left: 15,
        right: 15
      })
      .justifyContent(FlexAlign.SpaceBetween)

      //选项列表
      ICard() {
        //尾随闭包
        ICardItem({ leftText: '车辆信息' })
        ICardItem({ leftText: '任务数据' })
        ICardItem({ leftText: '系统设置' })
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}

export default My