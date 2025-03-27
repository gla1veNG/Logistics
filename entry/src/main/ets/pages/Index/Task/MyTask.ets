import { TaskTabs } from './TaskTabs'


@Component
struct MyTask {
  build() {
    Column() {
      TaskTabs()

    }
    .width('100%')
    .height('100%')
  }
}

export default MyTask