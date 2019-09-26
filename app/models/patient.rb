class Patient < ActiveRecord::Base
  #custom add relationship. @xieyinghua
  has_many :worksenses, :foreign_key => :patient_id
  has_many :barcodes, :foreign_key => :patient_id
end
