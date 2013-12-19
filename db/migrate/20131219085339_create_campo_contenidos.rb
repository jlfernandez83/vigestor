class CreateCampoContenidos < ActiveRecord::Migration
  def change
    create_table :campo_contenidos do |t|
      t.string :contenido
      t.string :titulo
      t.integer :pagina_id

      t.timestamps
    end
  end
end
