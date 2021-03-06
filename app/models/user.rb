class User < ActiveRecord::Base
  has_secure_password
  has_many :products

  unless ActiveRecord::Base.connection.table_exists?('users')
    connection.create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end

  validates :email, presence:true
  validates_format_of :email,
    :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
