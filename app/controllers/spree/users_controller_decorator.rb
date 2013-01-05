Spree::UsersController.instance_eval do
  
  before_filter :get_subscriber, :only => :show
  
end

Spree::UsersController.class_eval do
  
  def get_subscriber
    @subscriber = Spree::Subscriber.find_by_email(current_user.email) if current_user
  end
  
end