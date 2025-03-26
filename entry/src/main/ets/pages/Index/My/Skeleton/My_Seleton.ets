import { ISkeleton } from 'basic';

@Preview
@Component
export struct My_Skeleton {
  build() {
    Column() {
      // 用户信息
      Row() {
        ISkeleton({
          customWidth: "100%",
          customHeight: "100%",
          bdRadius: {
            bottomLeft: 10,
            bottomRight: 10
          }
        })
      }
      .width("100%")
      .height(290)

      // 本月任务
      Row() {
        ISkeleton({
          customWidth: "100%",
          customHeight: "100%",
          bgColor: '#efefefef',
          bdRadius: 8
        })
      }
      .width("100%")
      .height(134)
      .padding({ left: 15, right: 15 })
      .margin({ top: -20 })

      //选项列表
      Column({ space: 5 }) {
        ISkeleton({
          customWidth: "100%",
          customHeight: 50,
          bdRadius: 8
        })
        ISkeleton({
          customWidth: "100%",
          customHeight: 50,
          bdRadius: 8
        })

        ISkeleton({
          customWidth: "100%",
          customHeight: 50,
          bdRadius: 8
        })
      }
      .padding({ left: 15, right: 15 })
      .margin({ top: 30 })

    }
    .width("100%")
    .height("100%")
    .backgroundColor($r('app.color.white'))
  }
}


