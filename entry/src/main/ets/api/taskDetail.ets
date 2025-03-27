import { Http } from 'basic';
import { TaskDetailInfoModel } from '../models';

//任务详情
export const getTaskDetailInfoApi = (jobId: string): Promise<TaskDetailInfoModel> => {
  return Http.get<TaskDetailInfoModel>(`/tasks/details/${jobId}`)
}


