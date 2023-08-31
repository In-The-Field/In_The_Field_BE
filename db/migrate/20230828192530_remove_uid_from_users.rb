# frozen_string_literal: true

class RemoveUidFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :uid, :string
  end
end
