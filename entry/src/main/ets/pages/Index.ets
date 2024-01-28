let MyID = "derry.com.id.test"

//任务类
@Observed
class Task{
  static id: number = 1;
  //任务名称
  name: string = `目标${Task.id++}`
  finshion: boolean = false
}
// 统一的卡片样式
@Styles function card() {
  .width("95%")
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  //圆角
  .shadow({radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4})
}
// 任务统计信息
class Statlnfo {
  totalTask: number = 0
  finishTask: number = 0

  // constructor(totalTask_1: number, finishTask_1: number) {
  //   this.totalTask = totalTask_1
  //   this.finishTask = finishTask_1
  // }
  //没有链接后端先传自定义数据
}

// @Entry
@Component
struct Index {
  // @State stateInfo_1: Statlnfo = new Statlnfo(5,3)
  @Provide stateInfo: Statlnfo = new Statlnfo()
  @State message: string = 'Hello World'

  build() {
    Column(){
      //11   待完成事件
      // TaskStatistics({stateInfo_2:this.stateInfo_1})
      TaskStatistics()
      TaskList()
    }
    .height("100%")
    .width("100%")
    .backgroundColor(Color.Black)
  }
}
// @Preview
@Component
struct TaskStatistics {
  @Consume stateInfo : Statlnfo
  build(){
    Row(){
      Text("待办事项:")
        .fontColor(Color.Orange)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .margin({right:16})
      Row(){
        Progress(
          {
            value: this.stateInfo.finishTask,
            total: this.stateInfo.totalTask,
            type: ProgressType.Linear
          }
        )
          .width(150)
          .backgroundColor(Color.Orange)
          .color(Color.Red)
          .margin({right:16})
        Row(){
          Text(this.stateInfo.finishTask.toString())
            .fontSize(24)
            .fontColor(Color.Red)
          Text(' / '+this.stateInfo.totalTask.toString())
            .fontSize(24)
            .fontColor(Color.Orange)
        }
      }
    }
    .card()
    //卡片外框
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({top: 20, bottom: 10})
  }
}
@Component
struct TaskList {

  @Consume stateInfo: Statlnfo
  // 目标合集数组
  @State tasks: Task[] = []

  handleTeskChange(){
    this.stateInfo.totalTask = this.tasks.length
    this.stateInfo.finishTask = this.tasks.filter(item => item.finshion).length
  }

  build() {
    Column() {
      Button('定下您的目标 ')
        .width('90%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.tasks.push(new Task())
          this.handleTeskChange()
        })
        .backgroundColor(Color.Orange)

      List({space:10}){
        ForEach(
          this.tasks,
          (item: Task,index) =>{
            ListItem(){
              TaskItem({item: item, onTaskChange: this.handleTeskChange})
            }
          }
        )
      }
    }
  }
}
@Component
struct  TaskItem{
  item: Task
  onTaskChange: () => void
  build(){
    Row(){
      if (this.item.finshion){
        TextInput({text: this.item.name,placeholder: "请输入你的目标"})
          .width(200)
          .fontColor(Color.Gray)
          .opacity(0.3)
      }else {
        TextInput({text: this.item.name,placeholder: "请输入你的目标"})
          .width(200)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
      }
      Checkbox()
        .id(MyID)
        .select(this.item.finshion)
        .onChange(value =>{
          this.item.finshion = value
          this.onTaskChange
        })
    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}