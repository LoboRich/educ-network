class ClassStudent < ApplicationRecord
    belongs_to :group
    belongs_to :user
    enum statuses: {
		'Pending': 'Pending',
		'Joined': 'Joined'
	}
end
