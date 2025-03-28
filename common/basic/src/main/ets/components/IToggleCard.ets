@Component
export struct IToggleCard {
  //true 展示基本信息，false 收起
  @State toggleCard: boolean = true
  @BuilderParam CardContent: () => void
  @State title: string = '基本信息'

  build() {
    Column() {
      Row() {
        Text(this.title)
          .fontSize(16)
          .fontColor($r('app.color.text_primary'))
          .fontWeight(600)

        Image(this.toggleCard ? $r('app.media.ic_btn_cut') : $r('app.media.ic_btn_add'))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            animateTo({ duration: 300 }, () => {
              this.toggleCard = !this.toggleCard
            })

          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      if (this.toggleCard && this.CardContent) {
        this.CardContent()
      }

    }
    .backgroundColor($r('app.color.white'))
    .borderRadius(8)
    .padding(18)
    .margin({ top: 10, left: 15, right: 14 })
  }
}

