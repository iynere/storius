# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string           not null
#  email              :string           not null
#  password_digest    :string           not null
#  session_token      :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  bio                :text
#  image_url          :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class User < ApplicationRecord
  validates :username, :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_attached_file :photo, default_url: "https://s3.amazonaws.com/storius/storius-icon-triple.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  after_initialize :ensure_session_token

  has_many :storis
  has_many :annotations
  has_many :comments
  has_many :votes, inverse_of: :user

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return nil if user.nil?
    user.password_valid?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_valid?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
