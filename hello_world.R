library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "example"
  )
  ,tags$script(type = "text/jsx"
    ,"
      React.render(
        <h1>Hello, world!</h1>,
        document.getElementById('example')
      );
    " %>>% HTML
  )
) %>>%
  attachDependencies(
    htmlDependency(
      name = "react"
      ,version = "0.12.2"
      ,src = c(paste0(getwd(),"/build"))
      ,script = c("react.js","JSXTransformer.js")
    )
  ) %>>%
  html_print
