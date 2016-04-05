library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "example"
  )
  ,tags$script(type = "text/babel"
    ,"
      ReactDOM.render(
        <h1>Hello, world!</h1>,
        document.getElementById('example')
      );
    " %>>% HTML
  )
) %>>%
  attachDependencies(list(
    htmlDependency(
      name = "react"
      ,version = "0.14.8"
      ,src = c(paste0(getwd(),"/build"))
      ,script = c("react.min.js","react-dom.min.js")
    )
    ,htmlDependency(
      name = "babel-browser"
      ,version = "5.8.23"
      ,src = c(href="http://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23")
      ,script = c("browser.min.js")
    )
  )) %>>%
  html_print
