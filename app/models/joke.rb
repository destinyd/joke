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
  scope :older, asc(:created_at)
  scope :short, where(:tags.in => ['短篇'])
  scope :long, where(:tags.in => ['长篇'])
  scope :image, where(:tags.in => ['有图'])

  scope :newer_by, lambda{|joke| where(:created_at.gt => joke.created_at).older}
  scope :older_by, lambda{|joke| where(:created_at.lt => joke.created_at).recent}

  taggable_on :tags

  def older
    @older ||= Joke.older_by(self).first
  end

  def newer
    @newer ||= Joke.newer_by(self).first
  end
end
