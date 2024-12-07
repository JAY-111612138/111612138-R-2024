# 安裝和載入 Shiny 套件
install.packages("shiny")
library(shiny)

# UI
ui <- fluidPage(
  # App 標題
  titlePanel("Hello Shiny!"),
  # Sidebar 布局
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
      # 輸入：選擇分箱數
      sliderInput(
        inputId = "bins",
        label = "Number of bins:",
        min = 1,
        max = 50,
        value = 30
      )
    ),
    # Main panel
    mainPanel(
      # 輸出：直方圖
      plotOutput(outputId = "distPlot")
    )
  )
)

# Server
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(
      x, 
      breaks = bins, 
      col = "#75AADB", 
      border = "white", 
      xlab = "Waiting time to next eruption (in mins)", 
      main = "Histogram of waiting times"
    )
  })
}

# 啟動 Shiny App
shinyApp(ui = ui, server = server)


library(shiny)
library(DT)

# UI
ui <- fluidPage(
  HTML('<center>'),
  h3("Faithful 資料表 - DT 版"),
  HTML('</center>'),
  dataTableOutput("DT_table"),
  hr(),
  HTML('<center>'),
  h3("Faithful 資料表 - Shiny 版"),
  HTML('</center>'),
  tableOutput("shiny_table")
)

# Server
server <- function(input, output) {
  output$DT_table <- renderDataTable({
    datatable(faithful)
  })
  
  output$shiny_table <- renderTable({
    faithful
  })
}

# 啟動 Shiny App
shinyApp(ui = ui, server = server)

library(shiny)

# UI
ui <- fluidPage(
  # 選擇框
  selectInput(
    "bins",
    label = h3("Please select bins:"),
    choices = list("15" = 15, "20" = 20, "30" = 30),
    selected = 15
  ),
  # 直方圖
  plotOutput(outputId = "distPlot")
)

# Server
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = as.numeric(input$bins) + 1)
    hist(
      x, 
      breaks = bins, 
      col = "#75AADB", 
      border = "white", 
      xlab = "Waiting time to next eruption (in mins)", 
      main = "Histogram of waiting times"
    )
  })
}

# 啟動 Shiny App
shinyApp(ui = ui, server = server)







library(shiny)

# UI
ui <- fluidPage(
  # 輸入對話框
  textInput("bins", label = h3("請輸入 bins:"), value = "5"),
  # 直方圖
  plotOutput(outputId = "distPlot")
)

# Server
server <- function(input, output, session) {
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = as.numeric(input$bins) + 1)
    hist(
      x, 
      breaks = bins, 
      col = "#75AADB", 
      border = "white", 
      xlab = "Waiting time to next eruption (in mins)", 
      main = "Histogram of waiting times"
    )
  })
}

# 啟動 Shiny App
shinyApp(ui = ui, server = server)


# 安裝和載入 Shiny 套件
install.packages("shiny")
library(shiny)

# UI
ui <- fluidPage(
  # 標題
  titlePanel("Hello NYCU!"),
  # Sidebar 布局
  sidebarLayout(
    # Sidebar 面板
    sidebarPanel(
      # 滑桿輸入
      sliderInput(
        inputId = "bins", 
        label = "Number of bins:", 
        min = 1, 
        max = 50, 
        value = 30
      )
    ),
    # 主面板
    mainPanel(
      # 直方圖輸出
      plotOutput(outputId = "distPlot")
    )
  )
)

# Server
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # 使用 faithful 資料
    x <- faithful$waiting
    # 計算分箱
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 繪製直方圖
    hist(
      x, 
      breaks = bins, 
      col = "#75AADB", 
      border = "white", 
      xlab = "Waiting time to next eruption (in mins)", 
      main = "Histogram of Faithful Eruption Waiting Times"
    )
  })
}

# 啟動 Shiny App
shinyApp(ui = ui, server = server)





