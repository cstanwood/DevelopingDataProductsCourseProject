life_expectancy <-
  data.table::fread(
    input = "13100114.csv",
    sep = ",",
    header = T,
    stringsAsFactors = F,
    verbose = T,
    data.table = F,
    select = c("REF_DATE", "GEO", "Age group", "Sex", "Element", "VALUE")
  )
life_expectancy <- as_tibble(life_expectancy)
life_expectancy <-
  life_expectancy %>%
  filter(`Age group` == "0 years" &
           Element == "Life expectancy (in years) at age x (ex)") %>%
  select(-c(`Age group`, Element))

life_expectancy$REF_DATE <-
  as.integer(substr(life_expectancy$REF_DATE, 1, 4))

life_expectancy$VALUE <- as.numeric(life_expectancy$VALUE)
life_expectancy$GEO <- as.factor(life_expectancy$GEO)
life_expectancy$Sex <- as.factor(life_expectancy$Sex)

calcLm <- function(region) {
  model <- lm(VALUE ~ REF_DATE,
              data = filter(life_expectancy,
                            GEO == region &
                              Sex == "Both sexes"))
  life_expect_2018 <-
    predict(model, newdata = data.frame(REF_DATE = 2018))
  return <- data.frame(
    "Region" = region,
    "Rate Of Change" = round(model$coefficients[2], 2),
    "Predicted Life Expectancy for 2018" = round(life_expect_2018, 2)
  )
}

shinyServer(function(input, output, session) {
  mydataframe <- reactive({
    mylist <- lapply(input$Region, calcLm)
    do.call("rbind", mylist)
  })
  
  output$table <- renderDataTable(mydataframe())
  
  observeEvent(eventExpr = input$selectall,
               handlerExpr = {
                 updateCheckboxGroupInput(
                   session,
                   "Region",
                   label = regionLabel,
                   choices = regions,
                   selected = regions
                 )
               })
  
  observeEvent(eventExpr = input$selectnone,
               handlerExpr = {
                 updateCheckboxGroupInput(session,
                                          "Region",
                                          label = regionLabel,
                                          choices = regions, )
               })
  
  observeEvent(eventExpr = input$selectAllGender,
               handlerExpr = {
                 updateCheckboxGroupInput(
                   session,
                   "Gender",
                   label = genderLabel,
                   choices = genders,
                   selected = genders
                 )
               })
  
  observeEvent(eventExpr = input$selectNoneGender,
               handlerExpr = {
                 updateCheckboxGroupInput(session,
                                          "Gender",
                                          label = genderLabel,
                                          choices = genders)
               })
  
  output$plot1 <- renderPlot({
    # output$txt <- renderText({
    #   input$Region
    # })
    
    ggplot(
      data = filter(
        life_expectancy,
        GEO %in% input$Region & Sex %in% input$Gender
      ),
      aes(
        x = REF_DATE,
        y = VALUE,
        color = GEO,
        linetype = Sex
      )
    ) +
      scale_color_discrete(
        name = "Region",
        breaks = input$Region,
        labels = input$Region
      ) +
      scale_linetype_discrete(
        name = "Gender",
        breaks = input$Gender,
        labels = input$Gender
      ) +
      geom_line(size = .5) +
      theme_bw() +
      xlab("Year") +
      ylab("Life Expectancy") +
      ylim(70, 85)
  })
})
