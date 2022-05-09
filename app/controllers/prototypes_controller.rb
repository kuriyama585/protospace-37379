class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new ,:edit ,:destroy]

  def index
      # @prototype = Prototype.all
      @prototypes = Prototype.includes(:user).order("created_at DESC")
      # ＠インスタンス変数=モデル名.メソッド

    end
  
    def new
      @prototype = Prototype.new
    end

    
    # def create
    #   Post.create(content: params[:content])
    # end

    def create
      @prototype = Prototype.new(prototype_params)
      # binding.pry
      if @prototype.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      @prototype = Prototype.find(params[:id])
      @comment = Comment.new
      @comments = @prototype.comments
    end
  
    def edit
      @prototype = Prototype.find(params[:id])
    end

    def update
      prototype = Prototype.find(params[:id])

      if prototype.update(prototype_params)
      redirect_to root_path
      else
        render :edit
      end
    end

    def destroy
      # if user_signed_in? && current_user.id == @prototype.user_id
        prototype = Prototype.find(params[:id])
        prototype.destroy
        redirect_to root_path
      # end
    end

    private

    def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
      # params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
      # params.require(:tweet).permit(:name, :image, :text)
    end
  
    private

    unless  user_signed_in? && current_user.id == prototype.user_id
      redirect_to action: :index
    end
  # 下記の内容のprototypes_controllerというcontrollerファイルがあった
  # class PrototypesController < ApplicationController
  
  #   def index  # indexアクションを定義した
  #   end
  
  # end
  # ___________↑
end
