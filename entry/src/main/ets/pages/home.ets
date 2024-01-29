@Entry
@Component
struct Home {
  @State message: string = 'Hello World'
  @State cTabIndex : number = 0;

  build() {
    Tabs(){
      TabContent(){

      }
      .tabBar(this.bar("首页",$r("app.media.app_icon"),0))
      TabContent(){
        Column(){
          Text("此功能开发中······")
            .fontSize(20)
            .fontColor(Color.Green)
        }
      }
      .tabBar(this.bar("数据统计",$r("app.media.app_icon"),1))
      TabContent(){

      }
      .tabBar(this.bar("我的",$r("app.media.app_icon"),2))
    }
    .barPosition(BarPosition.End)
    .onChange((index)=>{
      this.cTabIndex = index
    })
  }
  @Builder bar(name: string,icon: Resource,index:number){
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }){
      Image(icon)
        .width(26)
        .height(26)
      Text(name)
        .fontSize(12)
        .fontColor(Color.Green)
    }
  }
}