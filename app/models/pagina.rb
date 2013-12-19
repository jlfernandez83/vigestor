class Pagina < ActiveRecord::Base
  has_many :campo_contenidos, dependent:destroy
  validates :tipo, :contenido, presence: true
  validates :url, presence: true, uniqueness: { case_sensitive: false } 
end
