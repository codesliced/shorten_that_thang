class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validate :has_http

  def self.random_phrase(number)
    string = ""
    number.times do
      string << ("a".."z").to_a.sample
    end
    string
  end

  def has_http
    unless long_url =~ URI.regexp
      errors.add(:long_url, "Not valid!")
    end
  end

end

__END__

my_url = Url.first
my_url.errors

errors is a pseudo hash



my_url.create

_______

my_url.new
my_url.valid?
my_url.save # assuming errors doesn't have stuff


{
  @base => <#Url:instance>
  @messages => { long_url: "Not valid! Doesn't have http://", 
                 click_count: "Can't be negative!" }
}
