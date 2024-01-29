import router from '@ohos.router'
@Entry
@Component
struct Columnrow {
  @State message: string = 'Hello World'
  onPageShow(){
    setTimeout(()=>{
      router.pushUrl({
        url:"pages/home"
      },100000)
    })
  }
  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }){
      Image($r("app.media.icon"))
        .width(122)
        .height(122)
        .margin(20)
      Text("欢迎来到，食物分类app")
        .fontSize(20)
        .fontColor(Color.White)
        .margin({bottom:10})
      Text("事务app，时时刻刻管理你的健康")
        .fontSize(16)
        .fontColor(Color.White)
    }
    .height("100%")
    .width("100%")
    .backgroundColor("#ff41de5a")
  }
}