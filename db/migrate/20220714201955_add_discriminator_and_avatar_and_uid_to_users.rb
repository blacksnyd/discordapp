class AddDiscriminatorAndAvatarAndUidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :discriminator, :string
    add_column :users, :avatar, :string
    add_column :users, :uid, :string
  end
end
