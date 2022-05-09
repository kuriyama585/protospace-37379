Rails.application.routes.draw do
  devise_for :users
  # get 'posts', to: 'protospace#index'
  # ___________↓一番のindex表示画面への遷移指示
  # root to: "prototypes#index"
  # ___________↑
  root to: 'prototypes#index'
  resources :prototypes,only: [:index, :new, :create,:show,:edit,:update,:destroy]
  # protospace onlyとの間に何かが入ります
  # コンマが必要になります。
  # ルートのコントローラー名(protospace)の最後にsをつける。
  resources :prototype do
    resources :comments, only: :create
  end
  resources :users, only: :show
end


# Rails.application.routes.draw do
  # devise_for :users
#   HTTPメソッド 'URIパターン', to: 'コントローラー名#アクション名'
#  end