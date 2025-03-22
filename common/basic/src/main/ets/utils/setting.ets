import { preferences } from '@kit.ArkData';
import { AdvertClass } from '../models/advert';
import { JSON } from '@kit.ArkTS';
import { TOKEN_KEY, XN_SETTING, XN_SETTING_AD } from '../../../../Index';

//广告的默认配置
export const defaultAd: AdvertClass = {
  //广告显示/隐藏
  showAd: true,
  //广告时长
  adTime: 10,
  //广告图片
  adImage: $r("app.media.start")
}

export class UserSettingClass {
  context: Context

  constructor(context: Context) {
    this.context = context
  }

  //创建仓库
  getStore() {
    return preferences.getPreferencesSync(this.context, { name: XN_SETTING })
  }

  //存储广告数据
  setUserAd(ad: AdvertClass) {
    // 获取创建的仓库
    const store = this.getStore()
    //给仓库存储数据
    store.putSync(XN_SETTING_AD, JSON.stringify(ad))
    //数据写入磁盘
    store.flush()
  }

  //获取数据
  getUserAd(): AdvertClass {
    const store = this.getStore()
    //获取广告数据
    const str = store.getSync(XN_SETTING_AD, JSON.stringify(defaultAd)) as string
    return JSON.parse(str) as AdvertClass
  }

  //存储token数据
  setUserToken(token: string) {
    // 获取创建的仓库
    const store = this.getStore()
    //给仓库存储数据
    store.putSync(TOKEN_KEY, token)
    //数据写入磁盘
    store.flush()
  }

  //获取存储在首选项的token数据
  getUserToken(): string {
    const store = this.getStore()
    return store.getSync(TOKEN_KEY, '') as string
  }
}
