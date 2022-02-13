module GroupsHelper
  def self.list(user)
    if user.role == 'teacher'
      @groups = user.groups
    elsif user.role == 'student'
      @groups = ClassStudent.where(user_id: user.id).map{|x| x.group}.uniq
    else
      @groups = Group.all
    end
  end
end
