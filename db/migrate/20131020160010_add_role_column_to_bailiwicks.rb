class AddRoleColumnToBailiwicks < ActiveRecord::Migration
  def change
    add_column :bailiwicks, :role, :string
  end
end
