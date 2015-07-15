# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  name                 :string
#  username             :string
#  email                :string
#  password_digest      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  location             :string
#  cloudinary_public_id :string
#

class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, exclusion: %w(signup signin signout users), format: {without: /\s/}
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 6}, unless: Proc.new { |a| a.password.blank? }

  def image=(image)
    if image.nil?
      self.cloudinary_public_id = nil
    else
      cloudinary = Cloudinary.upload(image)
      self.cloudinary_public_id = cloudinary.public_id
    end
  end

  def profile_image_url
    cloudinary = Cloudinary.new(public_id: cloudinary_public_id)
    cloudinary.profile_image_url
  end
end
