import { taskTabs } from './taskTabs'

@Component
struct MyTask {
  build() {
    Column() {
      taskTabs()

    }
    .width('100%')
    .height('100%')
  }
}

export default MyTask