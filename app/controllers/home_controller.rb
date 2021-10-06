class HomeController < ApplicationController

  def index
    @posts = Post.all
  end

  def write

  end

  def create
    if user_signed_in?
      post = Post.new
      post.user_id = current_user.id
      post.title = params[:title]
      post.content = params[:content]
      post.is_privacy = true
      post.save
  
      redirect_to '/'
    else
      redirect_back(fallback_location: '/')
    end
  end

  def privacy_update
    post = Post.find(params[:post_id])
    
    # if post.is_privacy == true
    #   post.is_privacy = false
    #   post.save
    # elsif post.is_privacy == false
    #   post.is_privacy = true
    #   post.save
    # end
    authenticate_my_post!(post) rescue return redirect_back(fallback_location: '/')
    post.is_privacy = !post.is_privacy
    post.save

    redirect_to '/'
  end

  def modify
    # if current_user.id == @check.user.id
      @post = Post.find(params[:post_id])
      authenticate_my_post!(@post)
    # else
    #   redirect_back(fallback_location: '/')
    # end
  end

  def update
    post = Post.find(params[:post_id])
    authenticate_my_post!(post) rescue return redirect_back(fallback_location: '/')
    post.user_id = current_user.id
    post.title = params[:title]
    post.content = params[:content]
    post.save

    redirect_to '/'
  end

  def delete
    post = Post.find(params[:post_id])
    # if current_user.id == @check.user.id
    authenticate_my_post!(post) rescue return redirect_back(fallback_location: '/')
      post.destroy
      redirect_to '/'
    # else
      # redirect_back(fallback_location: '/')
    # end
  end

  def reply_create
    if user_signed_in?
      reply = Reply.new
      reply.post_id = params[:post_id]
      reply.content = params[:content]
      reply.user_id = current_user.id
      reply.save
  
      redirect_to '/'
    else
      flash[:notice] = '로그인이 필요합니다'
      redirect_to '/'
    end
  end

  def reply_delete
    reply = Reply.find(params[:reply_id])
    # if current_user.id == @check.user.id
    authenticate_my_post!(reply) rescue return redirect_back(fallback_location: '/')
      reply.destroy
      redirect_to '/'
    # else 
    #   redirect_back(fallback_location: '/')
    # end
  end

  def reply_modify_form
    @reply = Reply.find(params[:reply_id])
    authenticate_my_post!(@reply)
  end

  def reply_update
    reply = Reply.find(params[:reply_id])
    authenticate_my_post!(reply) rescue return redirect_back(fallback_location: '/')
    reply.content = params[:content]
    reply.save

    redirect_to '/'
  end

  private

  def authenticate_my_post!(resource)
    if current_user.id != resource.user.id
      raise Error
    end
  end

end
