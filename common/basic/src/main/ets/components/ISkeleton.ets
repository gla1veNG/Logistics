@Component
export struct ISkeleton {
  customWidth: number | string = ""
  customHeight: number | string = ""
  circle: boolean = false
  bgColor: string = "#f3f4f5"
  bdRadius: number | string | BorderRadiuses = ''
  @State
  timer: number = -1

  aboutToAppear(): void {
    this.splash()
  }

  splash() {
    this.timer = setInterval(() => {
      if (this.bgColor === "#f3f4f5") {
        this.bgColor = "#f7f8f9"
      } else {
        this.bgColor = "#f3f4f5"
      }
    }, 100)
  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Row() {

    }
    .width(this.customWidth)
    .height(this.circle ? this.customWidth : this.customHeight)
    .borderRadius(this.circle ? this.customWidth : this.bdRadius)
    .backgroundColor(this.bgColor)

  }
}

