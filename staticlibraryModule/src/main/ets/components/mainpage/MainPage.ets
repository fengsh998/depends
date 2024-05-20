import router from '@ohos.router';

@Entry
@Component
export struct MainPage {
  @State message: string = 'Static Library Main Page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Blank()
        Button($r('app.string.back'))
          .fontSize('16fp')
          .width('296vp')
          .height('40vp')
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            router.back();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
