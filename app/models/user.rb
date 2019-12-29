class User < ActiveRecord::Base
  has_secure_password
  has_secure_password :recovery_password, validations: false
  unless ActiveRecord::Base.connection.table_exists?('users')
    connection.create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end

  validates :email, presence:true
  validates_format_of :email;
    :with => /^[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i
end
