class Joke
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  field :joke_id, type: Integer
  field :name, type: String
  #field :time, type: String
  field :text, type: String
  field :imgurl, type: String
  field :forward, type: Integer
  #field :comment, type: Integer
  field :videourl, type: String
  validates :joke_id, presence: true, uniqueness: true
  scope :recent, desc(:created_at)

  taggable_on :tags
end
