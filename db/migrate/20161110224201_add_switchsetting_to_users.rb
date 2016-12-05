class AddSwitchsettingToUsers < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :cat_baby_switch, :boolean
    add_column :users, :cat_prescool_switch, :boolean
    add_column :users, :cat_juniorscool_switch, :boolean
    add_column :users, :cat_highscool_switch, :boolean
    add_column :users, :cat_universityscool_switch, :boolean
    add_column :users, :cat_senior_switch, :boolean
    add_column :users, :cat_age10s_switch, :boolean
    add_column :users, :cat_age20s_switch, :boolean
    add_column :users, :cat_age30s_switch, :boolean
    add_column :users, :cat_age40s_switch, :boolean
    add_column :users, :cat_age50s_switch, :boolean
    add_column :users, :cat_age60s_switch, :boolean
    add_column :users, :cat_age70s80s90s_switch, :boolean
    add_column :users, :default, :false
    add_column :users, :null, :false
  end
end
