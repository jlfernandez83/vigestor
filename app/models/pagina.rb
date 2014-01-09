class Pagina < ActiveRecord::Base
  has_many :content_fields, dependent: :destroy
  validates :tipo, presence: true
  validates :url, presence: true, uniqueness: { case_sensitive: false } 
end
