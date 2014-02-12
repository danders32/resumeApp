class Job < ActiveRecord::Base
  attr_accessible :company_name, :end_date, :start_date, :work_summary
end
