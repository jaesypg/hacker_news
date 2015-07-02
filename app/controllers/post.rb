# CRUD routing
# http://guides.rubyonrails.org/routing.html

#1 display a list of all posts
get '/posts' do
  @posts = Post.all
  erb :index
end

#2 return an HTML form for creating a new post
get '/posts/new' do
  if session[:name] == nil
    redirect to '/users'
  else
    erb :'post/new'
  end
end

#3 create a new post
post '/posts' do
  @user = User.find(session[:id])
  @post = @user.posts.new(params[:post])
  if @post.save
    redirect to '/posts'
  else
    redirect to '/posts/new'
  end
end

#4 display a specific post
get '/posts/:id' do
  @post = Post.find(params[:id])
  if @post.url == nil
    # get all the comments belonged to a post
    @comments = @post.comments
    erb :'post/show'
  else
    redirect to @post.url
  end
end

#5 return an HTML form for editing a post
get '/posts/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :"comment/edit_comment"
end

#6 update a specific post
put '/posts/:id' do
  Comment.find(params[:id]).update_attributes(params[:comment])
  redirect to '/statuses'
end

#5 return an HTML form for deleting a post
get '/posts/:id/delete' do
  @comment = Comment.find(params[:id])
  erb :"comment/delete_comment"
end

#7 delete a specific post
delete '/posts/:id' do
  Comment.find(params[:id]).destroy
  redirect to '/statuses'
end

#3 create a new postvote
post '/posts/:id/votes' do
  @user = User.find(session[:id])
  @post = Post.find(params[:id])
  @postvote = @post.postvotes.new
  if @postvote.save
    @user.postvotes << @postvote
    redirect to '/posts'
  else
    redirect to '/posts'
  end
end




