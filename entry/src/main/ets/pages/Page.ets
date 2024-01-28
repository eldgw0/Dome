import router from '@ohos.router'
@Entry
@Component

struct ParentView {
  @State @Watch("time") counter: number = 0

  time(){
    router.pushUrl({
      url:"pages/Index"
    })
  }

  build() {
    Column() {
      Text("111")
        .onClick(()=>{
          this.time()
        })

      ce({jump:this.time})

      ChildA({ counterVal: this.counter })

      ChildB({ counterRef: $counter })
    }
  }
}

@Component
struct ce{
  @State maes: number = 5
  jump: () => void
  build(){
    Column(){

      Button(`${this.maes}`)
        .width(100)
        .margin(15)
        .onClick(() => {
          // this.maes += 1
          this.jump()
        })
    }
  }
}

@Component
struct ChildA {
  @Prop counterVal: number

  build() {
    Button(`ChildA:(${this.counterVal}) + 1`)
      .margin(15)
      .onClick(() => {
        this.counterVal += 1
      })
  }
}

@Component
struct ChildB {
  @Link counterRef: number

  build() {
    Button(`ChildB: (${this.counterRef}) + 1`)
      .margin(15)
      .onClick(() => {
        this.counterRef += 1
      })
  }
}