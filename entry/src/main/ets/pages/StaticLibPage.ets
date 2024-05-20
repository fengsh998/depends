//引用静态库中的页面
// import { MainPage } from 'customLib/Index'
import { MainPage } from 'harLib/Index'

@Entry
@Component
export struct StaticLibPage {
  build() {
    Row() {
      Column() {
        MainPage()
      }
      .width('100%')
    }
    .height('100%')
  }
}


