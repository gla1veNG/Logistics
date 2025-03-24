@Component
export struct ICardItem {
  leftText: string = ''
  showRightIcon: boolean = true
  rightIcon: ResourceStr = $r('app.media.ic_btn_more')
  @Prop rightText: string = ''
  showBottonBorder: boolean = true
  onRightClick: () => void = () => {
  }

  build() {
    Column() {
      Row() {
        Text(this.leftText)
          .fontSize(16)
          .fontWeight(400)
          .fontColor($r('app.color.text_primary'))

        Row() {
          if (this.rightText) {
            Text(this.rightText)
              .fontColor($r('app.color.text_secondary'))
              .fontSize(14)
              .fontWeight(400)
              .margin({ right: 5 })

          }
          if (this.showRightIcon) {
            Image(this.rightIcon)
              .width(24)
              .height(24)
          }
        }
        .onClick(() => {
          this.onRightClick()
        })
      }
      .width('100%')
      .height(60)
      .border({
        width: { bottom: this.showBottonBorder ? 1 : 0 },
        color: $r('app.color.background_divider')
      })
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}



