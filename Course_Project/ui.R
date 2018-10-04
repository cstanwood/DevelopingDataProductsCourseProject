shinyUI(fluidPage(
  titlePanel("Developing Data Products Course Project"),
  h3("Click documentation tab for instructions"),
  tabsetPanel(
    tabPanel("Application",
             sidebarLayout(
               sidebarPanel(
                 checkboxGroupInput (
                   inputId = "Region",
                   label = regionLabel,
                   choices = regions,
                   selected = regions
                 ),
                 actionButton("selectall", selectAllLabel),
                 actionButton("selectnone", selectNoneLabel),
                 checkboxGroupInput (
                   inputId = "Gender",
                   label = genderLabel,
                   choices = genders,
                   selected = genders
                 ),
                 actionButton("selectAllGender", selectAllLabel),
                 actionButton("selectNoneGender", selectNoneLabel)
               ),
               mainPanel(
                 h3("Change in Life Expectancy at Birth in Canada"),
                 h4(tagList(
                   a("Data from Statistics Canada", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310011401")
                 )),
                 plotOutput("plot1"),
                 em("Scroll down if necessary to see the entire table"),
                 dataTableOutput("table")
               )
             )),
    tabPanel(
      "Documentation",
      h3("Overview"),
      p(
        "This app shows life expectancy at birth in Canada. ",
        "It shows how life expectancy has changed between 1980 and 2016. ",
        "You can see life expectancy for all of Canada or for selected provinces, and for either men, women, or both together. ",
        "This enables you to make comparisons between different regions and between men and women."
      ),
      p(
        "The data is from the Statistics Canada web site, at",
        a(
          "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310011401",
          href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310011401"
        ),
        "."
      ),
      h3("Graph"),
      p(
        "The graph displays the change in life expectancy at birth over time, from 1980 until 2016. ",
        "Each year actually represents the beginning of a three year reference period; for example, 1980 means the average over 1980, 1981, and 1982.",
        "The different provinces of Canada are shown with different colors. Different genders are shown with different linetypes."
      ),
      h3("Select Region and Gender"),
      p(
        "You can select a different region of Canada, or the average for all of Canada, ",
        "by clicking the checkboxes under \"Select Region.\" Clicking \"All\" or \"None\" will select all regions or no regions.",
        "Note that one province, Prince Edward Island, is missing from the original data set."
      ),
      p(
        "You can select gender in the same way. Click \"Female\" or \"Male\" to see the life expectancy for men or women. ",
        "Click \"Both\" to see the average across both sexes. ",
        "The \"All\" and \"None\" buttons select all or none of the checkboxes."
      ),
      h3("Data Table"),
      p(
        "Below the graph there is a table that shows summary information for the selected regions. It always shows the average for both genders.",
        "The first column lists the selected regions. The second column shows the rate of change for that region. ",
        "This is the number of additional years of life expectancy per year. This lets you see which regions have the fastest improvement in life expectancy. ",
        "The third column shows the predicted life expectancy for the three year reference period beginning in 2018, ",
        "since the data set only goes to the period beginning in 2016.",
        "These columns are calculated using a linear regresssion model."
      ),
      p(
        "The columns can be sorted by clicking on the column heading. A particular region or number can be searched for in the \"Search\" box. ",
        "The number of entries to display at one time can also be selected, but this is not useful here since there are never more than 10 regions."
      )
      
    )
  )
))
? h3
