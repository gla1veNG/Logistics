import { IList } from 'basic'
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
  //初始下来刷新状态值
  @State refreshStatus: number = RefreshStatus.Inactive
  //请求任务列表数据的方法
  onLoad = async (flag?: boolean) => {
    try {
      //将状态修改为上拉加载中
      const res: TaskListDataModel = await getTaskListApi(this.queryParams)

      //数据追加
      flag ? this.taskList = res.items : this.taskList.push(...res.items)

      if (this.queryParams.page >= res.pages) {
        this.finished = true
      }
      //页面追加
      this.queryParams.page++


      //将状态修改为上拉加载结束
      this.loading = false
    } catch (e) {
      console.log('error', e)
    }
  }
  //下拉刷新方法
  onRefresh = async () => {
    this.queryParams.page = 1
    this.finished = false
    await this.onLoad(true)
  }

  @Builder
  renderItem(item: object) {
    TaskItemCard({
      taskItem: item as TaskListItemDataModel
    })
  }

  build() {
    IList({
      finishedText: '没有更多数据',
      loadingText: '加载中...',
      dataSource: this.taskList,
      renderItem: this.renderItem,
      onLoad: this.onLoad,
      finished: this.finished,
      onRefresh: this.onRefresh,
      loading: this.loading,
      refreshIng: this.refreshIng
    })
  }
}

export default TaskList