import { Http } from 'basic';
import { TaskListDataModel, TaskListParamModel } from '../models';

//任务列表接口
export const getTaskListApi = (params: TaskListParamModel): Promise<TaskListDataModel> => {
  return Http.get<TaskListDataModel>('tasks/list', params)
}


