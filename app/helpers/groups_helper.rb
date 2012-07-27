module GroupsHelper
  def is_founder?(group)
      return current_user.id == group.founder
  end
end
