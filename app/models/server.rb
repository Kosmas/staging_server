class Server < ActiveRecord::Base
  before_update :update_relevant_fields

  def update_relevant_fields
    case status
    when 'Approved' then self.approved_at = DateTime.now
    when 'Available' then self.issue, self.programmer, self.tester, self.test_started_at, self.approved_at = '','','','',''
    end
  end
end
