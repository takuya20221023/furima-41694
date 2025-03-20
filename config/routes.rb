Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  # 認証が必要な商品出品ページと商品作成ページ


  # 必要に応じて詳細、編集、削除などのアクションを追加
   resources :items

   resources :orders
end
