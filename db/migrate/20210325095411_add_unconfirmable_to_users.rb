class AddUnconfirmableToUsers < ActiveRecord::Migration
  # Note: You can't use change, as User.update_all will fail in the down migration
  def up
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    User.update_all confirmed_at: DateTime.now
  end

end
