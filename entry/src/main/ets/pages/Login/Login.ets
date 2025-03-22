@Entry
@Component
struct Login {
  @State message: string = 'Hello World';

  @Styles
  loginStyle(){
    .backgroundColor('#fff')
    .height(58)
    .border({ width: { bottom: 1 }, color: $r('app.color.background_divider') })
    .borderRadius(0)
  }

  build() {
    //顶部标题
    Column() {
      Text('小南物流')
        .fontSize(18)
        .height(28)
        .fontColor($r("app.color.text_primary"))
        .fontWeight(600)
      //账号登录标题
      Row() {
        Text('账号登录')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Row() {
          Text('手机号登录')
            .fontSize(16)
            .fontColor($r("app.color.primary"))
            .fontWeight(600)
          Image($r("app.media.ic_angle"))
            .width(10)
            .height(10)
            .margin({ left: 5 })
        }

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 50, bottom: 50 })

      //账户输入框
      TextInput({ placeholder: '请输入账号' })
        .loginStyle()
      //密码输入框
      TextInput({ placeholder: '请输入密码' })
        .type(InputType.Password)
        .loginStyle()
      //登录按钮
      Button({ type: ButtonType.Capsule }) {
        Text('登录')
      }
      .width('100%')
      .height(50)
      .backgroundColor($r('app.color.primary_disabled'))
      .fontColor($r('app.color.white'))
      .margin({ top: 50 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 32, right: 32 })
    .margin({ top: 30 })
  }
}