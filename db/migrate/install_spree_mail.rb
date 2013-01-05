class InstallSpreeMail < ActiveRecord::Migration
  
  def self.up
    create_table :spree_subscribers do |t|
      t.string     :token
      t.string     :name
      t.string     :email
      t.datetime   :unsubscribed_at
      t.timestamps
    end
    create_table :spree_emails do |t|
      t.string     :token
      t.text       :to
      t.string     :subject
      t.text       :body
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_subscribers
    drop_table :spree_emails
  end

end