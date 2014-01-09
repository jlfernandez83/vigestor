class CreateContentFields < ActiveRecord::Migration
  def change
    create_table :content_fields do |t|
      t.string :contenido
      t.string :pagina_id

      t.timestamps
    end
  end
end
