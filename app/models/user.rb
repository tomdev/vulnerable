require 'uri'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  FLAG = :admin

  validates :website, allow_blank: true, format: { with: URI::regexp(%w(http https)) }

  has_attached_file :cv
  do_not_validate_attachment_file_type :cv

  def to_json *args
    super(force_except: :encrypted_password)
  end
end
