class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    self.readers.map { |reader| reader.email }.join(";")
  end

  def self.most_popular
    Magazine.all.max_by { |magazine| magazine.subscriptions.count }
  end
end
