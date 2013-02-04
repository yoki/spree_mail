module Spree
  CheckoutController.instance_eval do 
    after_filter :create_subscriber  
  end

  CheckoutController.class_eval do 
    def create_subscriber
      if @current_user && !@current_user.new_record? && params[:newsletter].to_i == 1
        @subscriber = Subscriber.create!(:email => @current_user.email)            
      end
    end  
  end
end