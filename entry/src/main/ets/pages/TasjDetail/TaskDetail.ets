import { router } from '@kit.ArkUI';
import { INavBar, IToggleCard, RouterParamsModel } from 'basic';
import { getTaskDetailInfoApi } from '../../api/taskDetail';
import { TaskDetailInfoModel } from '../../models';

@Entry
@Component
struct TaskDetail {
  @State params: RouterParamsModel = {} as RouterParamsModel
  @State taskDetailInfo: TaskDetailInfoModel = {} as TaskDetailInfoModel

  aboutToAppear(): void {
    this.getParamsData()
    this.getTaskDetailInfo()
  }

  //获取任务页面传递过来的司机ID
  getParamsData() {
    this.params = router.getParams() as RouterParamsModel
  }

  //获取任务详情页数据
  async getTaskDetailInfo() {
    try {
      this.taskDetailInfo = await getTaskDetailInfoApi(this.params.id)
    } catch (e) {
      console.log('error', e)
    }

  }

  build() {

    Column() {
      INavBar({
        title: '任务详情',
        rightText: '取消任务'
      })
      IToggleCard()
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}