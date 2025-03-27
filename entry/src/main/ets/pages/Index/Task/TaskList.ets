import { getTaskListApi } from '../../../api/task'
import { TaskListDataModel, TaskListItemDataModel, TaskListParamModel, TaskTypeEnum } from '../../../models/task'
import TaskItemCard from './TaskItemCard'


@Component
struct TaskList {
  //保存任务列表数据
  @State taskList: TaskListItemDataModel[] = []
  //任务列表接口传递的参数
  @State queryParams: TaskListParamModel = {
    page: 1,
    pageSize: 5,
    status: TaskTypeEnum.Waiting
  }
  //初始时话变量保存请求状态
  @State loading: boolean = false
  //初始化一个变量，保存数据是否请求到
  @State finished: boolean = false
  //创建一个变量，保存下拉刷新的状态
  @State refreshIng: boolean = false

  //请求任务列表数据的方法
  async onLoad() {
    try {
      //将状态修改为上拉加载中
      this.loading = true
      const res: TaskListDataModel = await getTaskListApi(this.queryParams)

      if (this.queryParams.page >= res.pages) {
        this.finished = true
      }
      //页面追加
      this.queryParams.page++
      //数据追加
      this.taskList.push(...res.items)


      //将状态修改为上拉加载结束
      this.loading = false
    } catch (e) {
      console.log('error', e)
    }
  }

  @Builder
  getBottom() {
    Row() {
      if (this.finished) {
        Text('没有更多数据')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
      } else {
        LoadingProgress()
          .width(20)
          .aspectRatio(1)
          .color($r('app.color.text_secondary'))

        Text('数据加载中...')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
      }

    }
    .width('100%')
    .padding(10)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  getRefreshBuilder() {
    Row() {
      LoadingProgress()
        .width(40)
        .aspectRatio(1)
        .color($r('app.color.primary'))

      Text('刷新中')
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Refresh({ refreshing: $$this.refreshIng, builder: this.getRefreshBuilder() }) {
      List({ space: 10 }) {
        ForEach(this.taskList, (item: TaskListItemDataModel) => {
          ListItem() {
            TaskItemCard({
              taskItem: item
            })
          }
        })

        ListItem() {
          this.getBottom()
        }
      }
      .width('100%')
      .height('100%')
      .padding(15)
      .backgroundColor($r('app.color.background_page'))
      //滚动的滚动到底部触发
      .onReachEnd(() => {
        if (this.finished && this.loading) {
          return
        }
        this.onLoad()
      })
    }
  }
}

export default TaskList