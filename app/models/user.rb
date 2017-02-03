class User < ApplicationRecord

  include FriendlyId
  friendly_id :username

 acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
                   
	validates :username,
  uniqueness: true,
    presence: true,
    length: { :maximum => 8}

  acts_as_voter
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable

  has_many :polls

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

   private

  def should_generate_new_friendly_id?
    username_changed? || super
  end


end
