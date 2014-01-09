class AddTitleToContentFields < ActiveRecord::Migration
  def change
    add_column :content_fields, :title, :string
  end
end
