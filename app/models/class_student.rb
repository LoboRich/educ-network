class ClassStudent < ApplicationRecord
    belongs_to :group

    enum statuses: {
		'Pending': 'Pending',
		'Joined': 'Joined'
	}
end
