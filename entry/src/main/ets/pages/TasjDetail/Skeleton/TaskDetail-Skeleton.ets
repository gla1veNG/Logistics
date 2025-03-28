import { INavBar, ISkeleton } from 'basic';

@Component
export struct TaskDetailSkeleton {
  build() {
    Column() {
      INavBar({
        title: '任务详情',
        rightText: '取消任务'
      })
      Column({ space: 20 }) {
        ISkeleton({
          customWidth: '100%',
          customHeight: 300,
          bgColor: '#fff',
          bdRadius: 10
        })

        ISkeleton({
          customWidth: '100%',
          customHeight: 50,
          bgColor: '#fff',
          bdRadius: 10
        })
        ISkeleton({
          customWidth: '100%',
          customHeight: 50,
          bgColor: '#fff',
          bdRadius: 10
        })
        ISkeleton({
          customWidth: '100%',
          customHeight: 50,
          bgColor: '#fff',
          bdRadius: 10
        })
        ISkeleton({
          customWidth: '100%',
          customHeight: 50,
          bgColor: '#fff',
          bdRadius: 10
        })
      }
      .padding(20)
      .layoutWeight(1)

      ISkeleton({
        customWidth: '100%',
        customHeight: 60,
        bgColor: '#fff',
        bdRadius: 10
      })
    }
    .layoutWeight(1)
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}


