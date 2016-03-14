class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_authentication_token

  private
  def generate_authentication_token
    self.authentication_token = random_token
  end

  def random_token
    seed = "--#{rand(10000)}--#{Time.now}--"
    "#{Digest::SHA256.hexdigest(seed)}"
  end
end
