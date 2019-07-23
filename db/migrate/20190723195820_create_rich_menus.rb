class CreateRichMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :rich_menus do |t|
      t.string :rich_menu_id, null: false
      t.string :name, null: false
      t.string :menu_attribute, null: false, default: 'default'
      t.timestamps
    end
    add_index :rich_menus, :rich_menu_id, unique: true
    add_index :rich_menus, :name, unique: true
    add_index :rich_menus, :menu_attribute, unique: true
  end
end
