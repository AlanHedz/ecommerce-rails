Rails.application.routes.draw do
  resources :attachments, only:[:new, :destroy, :create, :show]
  resources :products
  resources :in_shopping_carts, only:[:create, :destroy]
  devise_for :users

  get "/carrito", to: "shopping_carts#show"
  get "/add/:product_id", as: :add_to_cart, to: "in_shopping_carts#create"
  post "/pagar", to:"payments#create"
  post "payments/cards", to:"payments#process_card"
  get "/checkout", to:"payments#checkout"
  get "/ok", to:"welcome#payment_succed"
  get "/descargar/:id", to:"links#download"
  get "/descargar/:id/archivo/:attachment_id", to:"links#download_attachment", as: :download_attachment
  get "/invalid", to:"welcome#unregistered"
  post "/emails/create", as: :create_email

  get "/ordenes", to:"ordenes#index"

  authenticated :user do 
    root 'welcome#index'
  end

  unauthenticated :user do
    devise_scope :user do
      root "welcome#unregistered", as: :unregistered_root
    end
  end
  
end
