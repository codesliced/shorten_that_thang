class Url < ActiveRecord::Base
  
  def self.random_phrase(number)
    string = ""
    number.times do
      string << ("a".."z").to_a.sample
    end
    string
  end

end
