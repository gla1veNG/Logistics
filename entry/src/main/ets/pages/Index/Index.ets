import { TabClass } from 'basic';
import Message from './Message/Message';
import My from './My/My';
import MyTask from './Task/MyTask';


@Entry
@Component
struct Index {
  //tabBar的数据
  @State tabsData: TabClass[] = [
    { title: '任务', icon: $r('app.media.ic_tab_btn_task'), name: 'task' },
    { title: '信息', icon: $r('app.media.ic_tab_btn_mess_nor'), name: 'message' },
    { title: '我的', icon: $r('app.media.ic_tab_btn_mine_nor'), name: 'my' }
  ]
  @Watch('updateName')
  //初始化一个变量，保存选中的TabBar
  @State currentIndex: number = 0
  @Provide currentName: string = 'task'

  //监听 tabbar 下标变化
  updateName() {
    this.currentName = this.tabsData[this.currentIndex].name
  }

  //自定义tabBar的布局
  @Builder
  getTabBar(item: TabClass) {
    Column() {
      Image(item.icon)
        .width(22)
        .height(22)
        .fillColor(item.name === this.tabsData[this.currentIndex].name ? $r('app.color.primary') :
        $r('app.color.text_primary'))

      Text(item.title)
        .fontSize(12)
        .fontWeight(400)
        .margin({ top: 5 })
        .fontColor(item.name === this.tabsData[this.currentIndex].name ? $r('app.color.primary') :
        $r('app.color.text_primary'))
    }
  }

  build() {
    Column() {

      Tabs({ barPosition: BarPosition.End, index: $$this.currentIndex }) {
        ForEach(this.tabsData, (item: TabClass) => {
          TabContent() {
            if (item.name === 'task') {
              MyTask()
            } else if (item.name === 'message') {
              Message()
            } else if (item.name === 'my') {
              My()
            }
          }.tabBar(this.getTabBar(item))
        })
      }
      .animationDuration(500)
    }
    .height('100%')
    .width('100%')
  }
}

function Task() {
  throw new Error('Function not implemented.');
}
