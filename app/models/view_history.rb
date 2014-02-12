class ViewHistory < ActiveRecord::Base
  
  attr_accessible :resume_id, :time_viewed, :ip
  
end

