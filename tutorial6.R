library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "content"
  )
  ,tags$script(type = "text/babel"
    ,'
    // tutorial3.js
    var CommentBox = React.createClass({
      render: function() {
        return (
          <div className="commentBox">
            <h1>Comments</h1>
            <CommentList />
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
      
    // tutorial6.js
    var Comment = React.createClass({
      render: function() {
        return (
          <div className="comment">
            <h2 className="commentAuthor">
              {this.props.author}
            </h2>
            {marked(this.props.children.toString())}
          </div>
        );
      }
    });

    ReactDOM.render(
      <CommentBox />,
      document.getElementById("content")
    );
    
    ' %>>% HTML
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
    ,htmlDependency(
      name = "jquery"
      ,version = "2.2.0"
      ,src = c(href = "http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/")
      ,script = c("jquery.min.js")
    )
    ,htmlDependency(
      name = "marked"
      ,version = "0.3.5"
      ,src = c(href = "http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.5/")
      ,script = c("marked.min.js")
    )
  )) %>>%
  html_print


# use reactR --------------------------------------------------------------
library(htmltools)
library(reactR)

tagList(
  tags$div(id = "content"),
  tags$script(babel_transform(
'// tutorial3.js
var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList />
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

// tutorial6.js
var Comment = React.createClass({
  render: function() {
    return (
      <div className="comment">
        <h2 className="commentAuthor">
        {this.props.author}
        </h2>
        {marked(this.props.children.toString())}
      </div>
    );
  }
});

ReactDOM.render(
  <CommentBox />,
  document.getElementById("content")
);
'
  ))
) %>>%
  attachDependencies(list(
    html_dependency_react(),
    htmlDependency(
      name = "jquery"
      ,version = "2.2.0"
      ,src = c(href = "http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/")
      ,script = c("jquery.min.js")
    ),
    htmlDependency(
      name = "marked"
      ,version = "0.3.5"
      ,src = c(href = "http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.5/")
      ,script = c("marked.min.js")
    )    
  )) %>>%
  browsable()

