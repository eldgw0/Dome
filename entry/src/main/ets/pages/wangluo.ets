import lottie, { AnimationItem } from '@ohos/lottie'
@Entry
@Component
struct Wangluo {
  @State message: string = 'Hello World'
  private renderingSettings: RenderingContextSettings = new RenderingContextSettings(true) // 设置开启抗锯齿
  private renderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSettings)  // 创建2D渲染上下文
  private animateItem: AnimationItem | null = null;
  build() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Column({space:10}){
          // 初始化渲染上下文


          // 加载Canvas画布
          Canvas(this.renderingContext)
            .height("30%")

          Button("加载动画")
            .width("70%")
            .height(40)
            .onClick(() => {
              this.animateItem?.destroy('2016'); //加载动画前先销毁之前加载的动画
              this.animateItem = lottie.loadAnimation({
                container: this.renderingContext,  // 渲染上下文
                renderer: 'canvas',                          // 渲染方式
                loop: true,                                  // 是否循环播放,默认true
                autoplay: true,                              // 是否自动播放，默认true
                path: "data/data.json",
                // animationData: this.jsonData,                // json对象数据
                initialSegment: [10,50]                      // 播放的动画片段
              })
            })
          Row({space:20}){
            Button("播放")
              .width("30%")
              .onClick(()=>{
                lottie.play()
              })
            Button("暂停")
              .width("30%")
              .onClick(()=>{
                lottie.pause()
              })
          }
        }
        .width("100%")
        .height("50%")
      }
      .width('100%')
  }
}