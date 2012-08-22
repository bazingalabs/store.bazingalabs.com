# This migration comes from spree_contact_form (originally 20101122153513)
class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :spree_messages do |t|
      t.belongs_to :topic
      t.string :name,  :null => false
      t.string :email,    :null => false
      t.string :order_number
      t.text   :message,  :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_messages
  end
end
