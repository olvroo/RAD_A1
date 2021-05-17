class CustomerController < ApplicationController
  before_filter :initialise
  require 'active_support'
  
  def home
    @email = params[:email]
    @error = params[:error]
    
    @title = "Customer - Home"
    @nav_header = "Home"
    
    @users = EmailUser.all
    flash[:alert] = ""
    messages = params[:notice]
    if messages != nil
      messages.each do |key, message|
        flash[:alert] << message 
      end
    end

    @saved_items = session[:saved_items]
    items = Item.all
    @populars = Item.select("*, (amount_saved+amount_bought) as popularity").where("id <=4").order("popularity DESC")
    @user = session[:user]
    # change from object to hash 
    @items = Array.new
    items.each do |item|
      @items.push(item.attributes)
    end
    # reduce saved items from items
    @saved_items.each do |saved|
      @items.delete_if {|item| item['id'] == saved['id']}
    end
    if @items.any? then @banner = @items[rand(@items.length)] else @banner = Hash.new end
  end
  
  def category
    @user = session[:user]
    @category = params[:category]
    @title = "Category"
    @nav_header = "Category - " + @category
    @category_items = Array.new
    items = Item.all
    items.each do |item| 
      if item.category == @category
        @category_items.push(item)
      end
    end
  end
  
  def save_item
    saved_items = session[:saved_items]
    @item = Item.find(params[:id])
    saved_items.push(@item)
    session[:saved_items] = saved_items
    redirect_to :controller => 'customer', :action => 'home'
  end
  
  def unsave_item
    saved_items = session[:saved_items]
    @item_id = params[:id].to_i
    saved_items.delete_if { |item| @item_id == item['id'] }
    session[:saved_items] = saved_items
    redirect_to :controller => 'customer', :action => 'saved_items'
  end
  
  def saved_items
    @user = session[:user]
    @title = "Saved Items"
    @nav_header = "Saved Items"
    @saved_items = session[:saved_items]
  end
  
  def popular
    @title = "Popular Items"
    @nav_header = "Popular"
    @user = session[:user]
    @populars = Item.select("*, (amount_saved+amount_bought) as popularity").order("popularity DESC")
   
  end
  
  def email_signup
    @username = params[:username]
    @email = params[:email]
    @re_password = params[:re_pass]
    @password = params[:pass]
    messages = Hash.new
    users = EmailUser.all
    error = false
    if @password != @re_password
      error = true
      messages[:password]="Password is not the same! <br>"
    end
    users.each do |user|
      if (user.username == @username)
        error = true
        messages[:username]="Username is already taken! <br>"
      end
      
      if (user.email == @email)
        error = true
        messages[:email]="Email has been registered! <br>"
      end
    end
    
    if error == false
      EmailUser.create({
        :username  => @username,
        :email  => @email,
        :password => Base64.encode64(@password)
      })
      messages[:signup]="Congratulatios! You have been successfully registered!"
    end
      
    redirect_to :controller => 'customer', :action => 'home', :notice => messages
  end
  
  def email_login
    @input = params[:input]
    @password = params[:pass]
    message = Hash.new
    message[:login]  = "Invalid Login"
    users = EmailUser.all
    users.each do |user| 
      if ((user.username == @input || user.email == @input) && Base64.decode64(user.password) == @password)
        session[:user] = user
        message[:login] = "Successful Login"
        break
      end
    end
    redirect_to :controller => 'customer', :action => 'home', :notice => message
  end
  
  def logout
    session.delete(:user)
    message = Hash.new
    message[:logout] = "You have logout successfully!"
    redirect_to :controller => 'customer', :action => 'home', :notice => message
  end
  
  def newsletter
    newsletters = Newsletter.all
    @email = params[:email]
    exist = false
    newsletters.each do |item|
      if item.email == @email
        exist = true
        break
      end
    end
    
    if !exist
      @newsletter = Newsletter.create({:email => @email })
      NewsletterMailer.welcome_email(@email).deliver_later
    end
    
    redirect_to :controller => 'customer', :action => 'home', :email => @email, :error => exist
  end

  def twitter_callback
    @user = User.find_or_create_from_twitter_auth_hash(auth_hash)
    session[:user] = @user
    redirect_to root_path
  end
 
  protected
 
  def auth_hash
    puts request.env['omniauth.auth']
  end
  
  private
  
  def initialise
    @categories = Collection.all
    session[:saved_items] ||= Array.new
    session[:user] ||= User.new
  end
end
