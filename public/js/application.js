$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var vote = function(post_id){
    console.log('1');
    alert("here" + post_id);
    // $.ajax({
    //   type: "post",
    //   url:"/posts/" + post_id + "/votes", //url:"/posts/1/votes"
    //   data: {
    //     post_id: post_id
    //   },
    //   succes: function(data){
    //     alert('succes');
    //   },
    //   error: function(jqXHR, textStatus, errorThrown){
    //     alert('error');
    //   }
    // });
  };
});
