class Album < ApplicationRecord
  validates :title,:year,:band_id,presence:true
  validates :live, inclusion: {in: [true,false]}      #special validation for boolean
end
