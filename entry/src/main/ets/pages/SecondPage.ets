import router from '@ohos.router';

/**
 * The SecondPage is the router push page.
 */
@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page';
  @State src: string = (router.getParams() as Record<string, string>)['src'];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize('38fp')
          .fontWeight(FontWeight.Bold)
        Text(this.src)
          .fontSize('38fp')
          .opacity(0.6)
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
      .height('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.page_bg'))
  }
}