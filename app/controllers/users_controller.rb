class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @name = current_user.name
    @prototypes = @user.prototypes    
    # ↑上記にusersコントローラーのshowアクションにインスタンス変数@userを定義した。且つ、
    # Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得するように記述
  end

end
