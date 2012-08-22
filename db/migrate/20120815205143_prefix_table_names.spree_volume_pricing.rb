# This migration comes from spree_volume_pricing (originally 20111206173307)
class PrefixTableNames < ActiveRecord::Migration
  def change
    rename_table :volume_prices, :spree_volume_prices
  end
end

