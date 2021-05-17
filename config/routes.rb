Rails.application.routes.draw do
    get 'customer/home'

    get 'customer/popular'

    get 'customer/category/:category(.:format)' => 'customer#category', as: :show_category

    get 'customer/saved_items'

    get 'customer/twitter_callback' => 'customer#twitter_callback'
    
    get '/customer/save_item/:id(.:format)' => 'customer#save_item', as: :save_item

    get '/customer/unsave_item/:id(.:format)' => 'customer#unsave_item', as: :unsave_item

    get 'customer/logout' => 'customer#logout'

    get '/auth/twitter/callback', to: 'customer#twitter_callback', as: :twitter_callback

    post '/customer/newsletter'

    post '/customer/email_login'

    post '/customer/email_signup'

	root 'customer#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
