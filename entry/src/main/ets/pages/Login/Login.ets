import { AccountFormModel } from '../../models'

@Entry
@Component
struct Login {
  @State accountForm: AccountFormModel = {
    account: "",
    password: ""
  }
  //控制loading
  @State showLoading: boolean = false

  //账号与密码非空状态处理
  getFormValidate() {
    if (this.accountForm.account && this.accountForm.password) {
      return true
    }
    return false
  }

  //登录方法
  submitLogin() {
    this.showLoading = true
    setTimeout(() => {
      this.showLoading = false
    }, 2000)
  }

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
      TextInput({ placeholder: '请输入账号', text: $$this.accountForm.account })
        .loginStyle()
      //密码输入框
      TextInput({ placeholder: '请输入密码', text: $$this.accountForm.password })
        .type(InputType.Password)
        .loginStyle()
      //登录按钮
      Button({ type: ButtonType.Capsule }) {
        Row() {
          if (this.showLoading) {
            LoadingProgress()
              .width(20)
              .height(20)
              .color($r('app.color.white'))
              .margin({ right: 12 })
          }

          Text('登录')
        }
      }
      .width('100%')
      .height(50)
      .backgroundColor(this.getFormValidate() ? $r('app.color.primary') : $r('app.color.primary_disabled'))
      .fontColor($r('app.color.white'))
      .margin({ top: 50 })
      .enabled(this.getFormValidate())
      .onClick(() => {
        this.submitLogin()
      })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 32, right: 32 })
    .margin({ top: 30 })
  }
}