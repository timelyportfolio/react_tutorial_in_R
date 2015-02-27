library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "content"
  )
  ,tags$script(type = "text/jsx"
    ,'
    // tutorial9.js
    var CommentBox = React.createClass({
        render: function() {
          return (
            <div className="commentBox">
              <h1>Comments</h1>
              <CommentList data={this.props.data} />
              <CommentForm />
            </div>
          );
        }
    });

    // tutorial4.js
    var CommentList = React.createClass({
      render: function() {
        return (
          <div className="commentList">
            <Comment author="Pete Hunt">This is one comment</Comment>
            <Comment author="Jordan Walke">This is *another* comment</Comment>
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
      
    // tutorial7.js
    var converter = new Showdown.converter();
    var Comment = React.createClass({
      render: function() {
        var rawMarkup = converter.makeHtml(this.props.children.toString());
        return (
          <div className="comment">
            <h2 className="commentAuthor">
              {this.props.author}
            </h2>
            <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
          </div>
        );
      }
    });

    // tutorial8.js
    var data = [
      {author: "Pete Hunt", text: "This is one comment"},
      {author: "Jordan Walke", text: "This is *another* comment"}
    ];

    React.render(
      <CommentBox data={data} />,
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
      ,script = "jquery-1.10.0.min.js"
    )
    ,htmlDependency(
      name = "showdown"
      ,version= "0.3.1"
      ,src = c(href = "http://cdnjs.cloudflare.com/ajax/libs/showdown/0.3.1")
      ,script = "showdown.min.js"
    )
  )) %>>%
  html_print
