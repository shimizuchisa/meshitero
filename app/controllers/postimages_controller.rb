class PostimagesController < ApplicationController
  def new
    @postimage = Postimage.new
  end

  def create
    @postimage = Postimage.new(postimage_params)
    @postimage.user_id = current_user.id
    if @postimage.save
      redirect_to postimages_path
    else
      render :new
    end
  end

  def index
    #@blogs = Blog.order(updated_at: :desc).page(params[:page]) #updated_atの新しい順
    @postimages = Postimage.order(created_at: :desc).page(params[:page])
  end

  def show
    @postimage = Postimage.find(params[:id])
    @post_comment = PostComment.new


  end

  def destroy #showのviewで削除するから@が必要
    @postimage = Postimage.find(params[:id])
    @postimage.destroy
    redirect_to postimages_path

  end

  #ストロングパラメータ
  private

  def postimage_params
    params.require(:postimage).permit(:shop_name, :image, :caption)

  end
end
