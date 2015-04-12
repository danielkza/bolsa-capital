module ApplicationHelper
  def users_with_ids
    Hash[User.all.map { |u| ["#{u.name} (#{u.email})" , u.id] }]
  end
end
