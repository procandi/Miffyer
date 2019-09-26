class User < ActiveRecord::Base
  #custom add relationship. @xieyinghua
  has_many :worksenses, :foreign_key => :user_id

  validates :uid, :allow_blank=>false, :length=>{ :maximum=>30 }, :uniqueness=>true #必填，不得超過30字，且不得重複。 @xieyinghua
  validates :upw, :allow_blank=>false, :length=>{ :maximum=>30 } #必填，不得超過30字。 @xieyinghua
  validates :uname, :allow_blank=>false, :length=>{ :maximum=>30 } #必填，不得超過30字。 @xieyinghua

  before_save { self.session_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s()) }	#儲存前必先把session_token做一個隨機的SHA1運算並儲存。 @xieyinghua

end
