require 'clockwork'
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end


  every(10.minutes, 'rake get money'){
    `rake get:money`
  }



end
