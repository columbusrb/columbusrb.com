class Member < ActiveRecord::Base
  has_many :presentations

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :github, length: { maximum: 30 }
  validates :twitter, length: { maximum: 30 }
  validates :bio, length: { maximum: 1000 }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def Member.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Member.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.search(search, page)
    order('name').where('name || twitter || github like ?', "%#{search}%").paginate(page: page, per_page: 20)
  end

  private

    def create_remember_token
      self.remember_token = Member.digest(Member.new_remember_token)
    end
end
