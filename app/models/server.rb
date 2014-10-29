class Server < ActiveRecord::Base
  before_update :update_approved_at

  def update_approved_at
    self.approved_at = DateTime.now if status == 'Approved'
  end
end
