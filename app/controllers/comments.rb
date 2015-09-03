post '/post/:id/comment/new' do
	@all_comments = Comment.all
	@comment_user = User.find_by(name: params[:name])
	@post = Post.find(params[:id])
	@new_comment = Comment.create(text: params[:text], user_id: @comment_user.id)
	@comment_user.comments << @new_comment
	@post.comments << @new_comment
	redirect "/post/#{@post.id}"
end