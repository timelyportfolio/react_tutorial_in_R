library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "content"
  )
  ,tags$script(type = "text/jsx"
    ,'
    // tutorial1.js
    var CommentBox = React.createClass({
      render: function() {
        return (
          <div className="commentBox">
            Hello, world! I am a CommentBox.
          </div>
        );
      }
    });

    // tutorial2.js
    var CommentList = React.createClass({
      render: function() {
        return (
          <div className="commentList">
            Hello, world! I am a CommentList.
          </div>
        );
      }
    });
    
    var CommentForm = React.createClass({
      render: function() {
        return (
          <div className="commentForm">
            Hello, world! I am a CommentForm.
          </div>
        );
      }
    });

    React.render(
      <CommentBox />,
      document.getElementById("content")
    );
    ' %>>% HTML
  )
) %>>%
  attachDependencies(list(
    htmlDependency(
      name = "react"
      ,version = "0.12.2"
      ,src = c(paste0(getwd(),"/build"))
      ,script = c("react.js","JSXTransformer.js")
    )
    ,htmlDependency(
      name = "jquery"
      ,version = "1.10.0"
      ,src = c(href = "http://code.jquery.com")
      ,script = c("jquery-1.10.0.min.js")
    )
  )) %>>%
  html_print
