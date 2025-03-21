import { AdvertClass } from 'basic'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct Start {
  @State adObj: AdvertClass = {
    showAd: false,
    adTime: 5
  }
  @State timer: number = -1

  //页面开始加载就触发
  aboutToAppear(): void {
    //调用倒计时方法
    this.countDown()
  }

  //倒计时方法
  countDown() {
    this.timer = setInterval(() => {
      if (this.adObj.adTime === 0) {
        clearInterval(this.timer)
        //销毁子窗口
        // this.closeWin()
        return
      }
      this.adObj.adTime--
    }, 1000)
  }

  //销毁子窗口方法
  closeWin() {
    //1.查找要销毁的窗口再进行销毁
    window.findWindow("ad_window").destroyWindow()
  }

  //页面销毁，清除定时器
  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($r("app.media.start"))
        .objectFit(ImageFit.Cover)

      Text(this.adObj.adTime + "秒后跳过")
        .padding({ left: 10, right: 10 })
        .margin({ top: 40, right: 20 })
        .height(30)
        .fontSize(14)
        .borderRadius(15)
        .textAlign(TextAlign.Center)
        .backgroundColor($r("app.color.background_page"))
        .onClick(() => {
          this.closeWin()
        })
    }

  }
}