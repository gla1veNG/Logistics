import { ICard, ICardItem, IConfirm, INavBar, UserSettingClass } from 'basic';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Setting {
  //实例化弹窗对象
  controller: CustomDialogController = new CustomDialogController({
    builder: IConfirm({
      message: '确定要退出登录吗',
      buttonList: [{ text: '取消', fonColor: $r('app.color.text_primary') },
        {
          text: '确定', fonColor: $r('app.color.primary'), action: () => {
          this.logOut()
        }
        }]
    }),
    //去掉默认弹窗样式
    customStyle: true
  })

  //退出登录
  logOut() {
    //删除token
    const setting = new UserSettingClass(getContext())
    setting.deleteUserToken()

    //跳转登录页
    router.replaceUrl({
      url: 'pages/Login/Login'
    })

  }

  build() {
    Column() {
      INavBar({ title: '系统设置' })
        .margin({ bottom: 20 })
      //选项列表
      ICard() {
        ICardItem({ leftText: '换绑手机' })
        ICardItem({ leftText: '修改密码' })
        ICardItem({ leftText: '消息通知设置' })
        ICardItem({ leftText: '清理缓存' })
      }

      //退出按钮
      Row() {
        Button('退出', { type: ButtonType.Normal })
          .width('100%')
          .height(60)
          .fontColor($r('app.color.text_primary'))
          .backgroundColor($r('app.color.white'))
          .borderRadius(8)
          .onClick(() => {
            //打开弹窗
            this.controller.open()
          })
      }
      .width('100%')
      .padding({ left: 15, right: 15 })
      .margin({ top: 20 })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}