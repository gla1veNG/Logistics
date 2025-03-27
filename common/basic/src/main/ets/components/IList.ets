@Component
export struct IList {
  @Prop finishedText: string = '没有更多数据了'
  @Prop loadingText: string = '数据加载中...'
  //保存任务列表数据
  @Prop dataSource: object[] = []
  //任务列表接口传递的参数

  //初始时话变量保存请求状态
  @Prop loading: boolean = false
  //初始化一个变量，保存数据是否请求到
  @Prop finished: boolean = false
  //创建一个变量，保存下拉刷新的状态
  @Prop refreshIng: boolean = false
  //初始下来刷新状态值
  @Prop refreshStatus: number = RefreshStatus.Inactive
  @BuilderParam renderItem: (item: object) => void
  //下拉刷新方法
  onRefresh: () => Promise<void> = async () => {
  }
  //请求任务列表数据的方法
  onLoad: (flag?: boolean) => void = () => {
  }

  @Builder
  getBottom() {
    Row() {
      if (this.finished) {
        Text(this.finishedText)
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
      } else {
        LoadingProgress()
          .width(20)
          .aspectRatio(1)
          .color($r('app.color.text_secondary'))

        Text(this.loadingText)
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
      }

    }
    .width('100%')
    .padding(10)
    .justifyContent(FlexAlign.Center)
  }

  //下拉刷新提示当前状态
  getRefreshText() {
    //如果下拉距离小于刷新距离，提示继续下拉
    //如果下拉距离超过刷新距离，松手刷新
    //如果当前状态是刷新中，正在刷新
    switch (this.refreshStatus) {
      case RefreshStatus.Inactive:
        return ''
      case RefreshStatus.Drag:
        return '继续下拉'
      case RefreshStatus.OverDrag:
        return '松手刷新'
      case RefreshStatus.Refresh:
        return '正在刷新'
      default:
        return ''
    }
  }

  @Builder
  getRefreshBuilder() {
    Row() {
      LoadingProgress()
        .width(40)
        .aspectRatio(1)
        .color($r('app.color.primary'))

      Text(this.getRefreshText())
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
        ForEach(this.dataSource, (item: object) => {
          ListItem() {
            this.renderItem(item)
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
    .onStateChange(async (state) => {
      this.refreshStatus = state
      if (this.refreshStatus === RefreshStatus.Refresh) {
        await this.onRefresh()
        this.refreshIng = false
      }

    })
  }
}

