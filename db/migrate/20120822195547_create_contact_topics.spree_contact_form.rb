# This migration comes from spree_contact_form (originally 20101122153512)
class CreateContactTopics < ActiveRecord::Migration
  def self.up
    create_table :spree_contact_topics do |t|
      t.string :name
      t.string :emails

      t.timestamps
    end
  end

  def self.down
    drop_table :spree_contact_topics
  end
end
