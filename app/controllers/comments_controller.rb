class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    # ストロングパラメーターに、【コメントのテキスト】＋【user_id(自分のID 誰のコメントか分かるようにするため)】＋
    # 【proto_id(どの投稿かを分かるようにするため】をデータベース送る記述をする。
  end
end
