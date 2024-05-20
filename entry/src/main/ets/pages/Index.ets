import router from '@ohos.router';
import { add } from 'hspLib'
import { SubAbilityPage } from '@fsh/abilityModule/Index'

@Entry
@Component
struct Index {
  @State message: string = '依赖引用DEMO'
  @State sum: number = 0
  a: number = 0
  b: number = 0
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text("a:")
            .fontSize(15)
          Blank()
          TextInput({placeholder:'请输入a的值'})
            .onChange((v)=>{
              this.a = new Number(v).valueOf()
            })
        }
        Row() {
          Text("b:")
            .fontSize(15)
          Blank()
          TextInput({placeholder:'请输入b的值'})
            .onChange((v)=>{
              this.b = new Number(v).valueOf()
            })
        }
        Row() {
          Text("sum:")
            .fontSize(15)
          Blank()
          Text(`${this.sum}`)
        }
        Button('计算结果')
          .width('200vp')
          .height('40vp')
          .onClick(()=>{
            this.sum = add(this.a,this.b)
          })
        Blank()
        Button('同目录页面跳转')
          .width('200vp')
          .height('40vp')
          .onClick(this.onStaticLibCall.bind(this))
        Blank()
        Button('静态库页面跳转')
          .width('200vp')
          .height('40vp')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/StaticLibPage',
              params: {
                title: 'From Entry Page Index call.'
              }
            },
              router.RouterMode.Single,(err) => {
                if (err) {
                  console.error(`push error: ${err}`)
                  return
                }
                console.info('push success!')
              })
          })
        Blank()
        Button('动态库页面跳转')
          .width('200vp')
          .height('40vp')
          .onClick((sender) => {
            router.pushUrl({
              url:'pages/ShareLibPage',
              params: {
                title: 'From Entry Page Index call.'
              }
            },
              router.RouterMode.Single,(err) => {
                if (err) {
                  console.error(`push error: ${err}`)
                  return
                }
                console.info('push success!')
              })
          })

        SubAbilityPage()
      }
      .width('100%')
    }
    .height('100%')
  }

  ///onClicked
  onStaticLibCall() {
    router.pushUrl({
      url: 'pages/SecondPage',
      params: {
        src: 'for Index'
      }
    })
  }

}