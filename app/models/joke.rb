class Joke
  include Mongoid::Document
  field :joke_id, type: Integer
  field :name, type: String
  #field :time, type: String
  field :text, type: String
  field :imgurl, type: String
  field :forward, type: Integer
  #field :comment, type: Integer
  field :videourl, type: String
  validates :joke_id, presence: true, uniqueness: true
end
