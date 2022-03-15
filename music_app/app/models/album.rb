class Album < ApplicationRecord
  validates :title,:year,:band_id,:live,presence:true
end
