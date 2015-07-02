# CRUD routing
# http://guides.rubyonrails.org/routing.html

#1 display a list of all comments
get '/comemnts' do
end

#2 return an HTML form for creating a new comment
get '/comments/new' do
end

#3 create a new comment belonged to a post
post '/posts/:id/comments' do
  session[:name] = "jc"
  session[:id] = 2
  @user = User.find(session[:id])
  @post = Post.find(params[:id])
  @comment = @post.comments.new(params[:comment])
  if @comment.save
    @user.comments << @comment
    redirect to '/posts'
  else
    redirect to '/posts/#{params[:id]}'
  end
end

#4 display a specific comment
get '/comments/:id' do
  @post = Post.find(params[:id])
  if @post.url == nil
    # get all the comments belonged to a post
    @comments = @post.comments
    erb :'post/show'
  else
    redirect to @post.url
  end
end

#5 return an HTML form for editing a comment
get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :"comment/edit_comment"
end

#6 update a specific comment
put '/comments/:id' do
  Comment.find(params[:id]).update_attributes(params[:comment])
  redirect to '/statuses'
end

#5 return an HTML form for deleting a comment
get '/comments/:id/delete' do
  @comment = Comment.find(params[:id])
  erb :"comment/delete_comment"
end

#7 delete a specific comment
delete '/comments/:id' do
  Comment.find(params[:id]).destroy
  redirect to '/statuses'
end

