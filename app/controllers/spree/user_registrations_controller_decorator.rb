Spree::UserRegistrationsController.instance_eval do 
  after_filter :create_subscriber  
end

Spree::UserRegistrationsController.class_eval do 
  def create_subscriber
    if @user && !@user.new_record? && params[:newsletter].to_i == 1
      @subscriber = Spree::Subscriber.create(:email => @user.email)            
    end
  end  
end