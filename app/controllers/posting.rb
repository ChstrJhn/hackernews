post '/new_post' do
	@post_details = params[:new_post]
	@user = current_user
	@new_post = Post.create(@post_details)
	@user.posts << @new_post
	redirect '/'
end

get '/post/:id' do
	@all_comments = Comment.all
	@post = Post.find(params[:id])
	erb :post
end

post '/post/:id/vote' do
@user = current_user
@post = Post.find(params[:id])
  unless @post.vote(current_user)
  	redirect to ("/?error=You've already voted for this post, loser!")
  end

  if request.xhr?
  	return {votes: @post.count}.to_json
  	if @post.voters.include?(current_user)
  		redirect to ("/?error=You've already voted for this post, loser!")
  	end
  else
	redirect '/'
  end
end