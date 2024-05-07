class AddUserIdToEvents < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:events, :user_id)
      add_reference :events, :user, foreign_key: true
    end
  end
end