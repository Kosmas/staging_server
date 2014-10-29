class Server < ActiveRecord::Base
  before_update :update_relevant_fields

  def update_relevant_fields
    case status
    when 'Approved' then self.approved_at = DateTime.now
    when 'Available' then self.issue, self.programmer, self.tester, self.test_started_at, self.approved_at = '','','','',''
    end
  end

#  def update_approved_at
#    self.approved_at = DateTime.now if status == 'Approved'
#  end
#
#  def clear_fields_when_available
#    if status == 'Available'
#      self.issue = ""
#      self.programmer = ""
#      self.tester = ""
#      self.test_started_at = ""
#      self.approved_at = ""
#    end
#  end
end
