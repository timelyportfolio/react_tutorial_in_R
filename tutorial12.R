library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "content"
  )
  ,tags$script(type = "text/babel"
    ,'
    // tutorial12.js
    var CommentBox = React.createClass({
      getInitialState: function() {
        return {data: []};
      },
      render: function() {
        return (
          <div className="commentBox">
            <h1>Comments</h1>
            <CommentList data={this.state.data} />
            <CommentForm />
          </div>
       );
      }
    });

    // tutorial10.js
    var CommentList = React.createClass({
      render: function() {
        var commentNodes = this.props.data.map(function(comment){
          return (
            <Comment author={comment.author} key={comment.id}>
              {comment.text}
            </Comment>
          )
        });
        return (
          <div className="commentList">
            {commentNodes}
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
    var Comment = React.createClass({
      rawMarkup: function() {
        var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
        return { __html: rawMarkup };
      },
    
      render: function() {
        return (
          <div className="comment">
            <h2 className="commentAuthor">
              {this.props.author}
            </h2>
            <span dangerouslySetInnerHTML={this.rawMarkup()} />
          </div>
        );
      }
    });

    // tutorial8.js
    var data = [
      {author: "Pete Hunt", text: "This is one comment"},
      {author: "Jordan Walke", text: "This is *another* comment"}
    ];

    // tutorial11.js
    ReactDOM.render(
      <CommentBox url="comments.json" />,
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
'// tutorial12.js
var CommentBox = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data} />
        <CommentForm />
        </div>
    );
  }
});

// tutorial10.js
var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function(comment){
      return (
        <Comment author={comment.author} key={comment.id}>
        {comment.text}
        </Comment>
      )
    });
    return (
      <div className="commentList">
      {commentNodes}
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
var Comment = React.createClass({
  rawMarkup: function() {
    var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    return { __html: rawMarkup };
  },
  
  render: function() {
    return (
      <div className="comment">
        <h2 className="commentAuthor">
        {this.props.author}
      </h2>
        <span dangerouslySetInnerHTML={this.rawMarkup()} />
        </div>
    );
  }
});

// tutorial8.js
var data = [
  {author: "Pete Hunt", text: "This is one comment"},
  {author: "Jordan Walke", text: "This is *another* comment"}
  ];

// tutorial11.js
ReactDOM.render(
  <CommentBox url="comments.json" />,
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

