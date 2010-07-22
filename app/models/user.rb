class User
  def is_admin?
    email == 'admin@test.com'
  end

  def to_s
    email
  end
end
