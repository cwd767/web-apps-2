class PostsController < ApplicationController

  def index
    # find all Post rows
    @posts = Post.all
    # render posts/index view
  end

  def new
    # render posts/new view with new Post form
  end

  def create
    post = Post.new
    post["author"] = params["author"]
    post["body"] = params["body"]

    if params["image"].present?
      uploaded_file = params["image"]
      filename = "#{SecureRandom.hex(8)}_#{uploaded_file.original_filename}"
      save_path = Rails.root.join("public", "uploads", filename)
      FileUtils.mkdir_p(Rails.root.join("public", "uploads"))
      File.binwrite(save_path, uploaded_file.read)
      post["image"] = "/uploads/#{filename}"
    end

    post.save
    redirect_to "/posts"
  end

end
