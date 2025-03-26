import { getTaskListApi } from '../../../api/task'
import { TaskListDataModel, TaskListItemDataModel, TaskListParamModel, TaskTypeEnum } from '../../../models/task'


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

  aboutToAppear(): void {
    this.getTaskList()
  }

  //获取任务列表数据
  async getTaskList() {
    try {
      const res: TaskListDataModel = await getTaskListApi(this.queryParams)
      this.taskList = res.items

    } catch (e) {
      console.log('error', e)
    }

  }

  build() {
    Column() {
      Text(JSON.stringify(this.taskList, null, 2))
    }
  }
}

export default TaskList