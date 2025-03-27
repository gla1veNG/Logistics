import { router } from '@kit.ArkUI';
import { RouterParamsModel } from 'basic';

@Entry
@Component
struct TaskDetail {
  @State params: RouterParamsModel = {} as RouterParamsModel

  aboutToAppear(): void {
    this.getParamsData()
  }

  //获取任务页面传递过来的司机ID
  getParamsData() {
    this.params = router.getParams() as RouterParamsModel
  }

  build() {

    Column() {
      Text('11111')
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}