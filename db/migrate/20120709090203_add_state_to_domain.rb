class AddStateToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :state, :boolean, :default => true

    Domain.all.each do |f|
      f.update_attribute(:state, true)
    end
  end

end
