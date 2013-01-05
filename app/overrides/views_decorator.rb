Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "spree_mail_account_summary",
  :insert_after => "[data-hook='account_my_orders'], #account_my_orders[data-hook]",
  :partial => "hooks/account_summary",
  :disabled => false)


Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "spree_mail_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:subscribers) %>",
                     :disabled => false)

# module SpreeMail
#   class CustomHooks < Spree::ThemeSupport::HookListener
    
#     insert_after :account_summary, 'hooks/account_summary'
    
#     insert_after :footer_left,  'hooks/footer_left'
#     insert_after :signup_below_password_fields, 'hooks/signup_checkbox'

#     insert_after :admin_tabs,   'admin/hooks/subscribers_tab'

#   end
# end