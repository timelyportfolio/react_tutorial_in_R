library(htmltools)
library(pipeR)

tagList(
  tags$div(
    id = "content"
  )
  ,tags$script(type = "text/jsx"
    ,'
    // tutorial14.js
    var CommentBox = React.createClass({
      loadCommentsFromServer: function() {
        $.ajax({
          url: this.props.url,
          dataType: "json",
          success: function(data) {
            this.setState({data: data});
          }.bind(this),
          error: function(xhr, status, err) {
            console.error(this.props.url, status, err.toString());
          }.bind(this)
        });
      },
      getInitialState: function() {
        return {data: []};
      },
      componentDidMount: function() {
        this.loadCommentsFromServer();
        setInterval(this.loadCommentsFromServer, this.props.pollInterval);
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
          var commentNodes = this.props.data.map(function (comment) {
            return (
              <Comment author={comment.author}>
                {comment.text}
              </Comment>
            );
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

    // tutorial14.js
    React.render(
      <CommentBox url="https://gist.githubusercontent.com/timelyportfolio/54314c31733f4b73f2a0/raw/0668753905075f5ea3ef8a2d5198702cf0c473d5/comments.json" pollInterval={2000} />,
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
  html_print(viewer=browseURL)
