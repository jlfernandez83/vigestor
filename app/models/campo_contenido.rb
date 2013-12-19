class CampoContenido < ActiveRecord::Base
  belongs_to :pagina
  validates :contenido, presence: true
  validates :pagina_id, presence: true
end

