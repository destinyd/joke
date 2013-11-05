# coding: utf-8
class Joke
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  field :joke_id, type: String
  field :name, type: String
  #field :time, type: String
  field :text, type: String
  field :imgurl, type: String
  field :forward, type: Integer
  #field :comment, type: Integer
  field :videourl, type: String
  validates :joke_id, presence: true, uniqueness: true
  scope :recent, desc(:created_at)
  scope :short, where(:tags.in => ['短篇'])
  scope :long, where(:tags.in => ['长篇'])
  scope :image, where(:tags.in => ['有图'])

  taggable_on :tags
end
