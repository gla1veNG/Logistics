import { AdvertClass } from 'basic'

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
        return
      }
      this.adObj.adTime--
    }, 1000)
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
        .margin({ top: 20, right: 20 })
        .height(30)
        .fontSize(14)
        .borderRadius(15)
        .textAlign(TextAlign.Center)
        .backgroundColor($r("app.color.background_page"))
    }

  }
}