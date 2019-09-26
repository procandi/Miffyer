class Site < ActiveRecord::Base
	#custom add relationship. @xieyinghua
	has_many :worksenses, :foreign_key => :site_id
	has_many :barcodes, :foreign_key => :site_id
end
