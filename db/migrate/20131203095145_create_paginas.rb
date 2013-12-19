class CreatePaginas < ActiveRecord::Migration
  def change
    create_table :paginas do |t|
      t.string :tipo
      t.string :contenido
      t.string :url

      t.timestamps
    end
    add_index :paginas, [:url]
  end
end
