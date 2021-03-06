Rails.application.routes.draw do
  get 'card/new'

  get 'card/show'

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users, only: [:index,:show,:new,:edit,:update,:destroy]do
    member do
      get :mypage
      get :logout
    end
    resources :mypage, only: [:index]
end

  resources :items, only: [:index,:new,:create,:show,:edit,:update,:destroy]do
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
    end
  end
end

  
  
  resources :mypage, only: [:index]
  


  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end

  resources :card, only: [:new, :show,:index] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end



end
