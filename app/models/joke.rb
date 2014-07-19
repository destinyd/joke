# coding: utf-8
class Joke
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  field :joke_id, type: String
  field :title, type: String
  field :name, type: String
  #field :time, type: String
  field :text, type: String
  field :imgurl, type: String
  field :forward, type: Integer, default: 0
  #field :comment, type: Integer
  field :videourl, type: String
  validates :joke_id, presence: true, uniqueness: true
  scope :recent, desc(:created_at)
  scope :older, asc(:created_at)
  scope :short, where(:tags.in => ['短篇'])
  scope :long, where(:tags.in => ['长篇'])
  scope :image, where(:tags.in => ['有图'])
  scope :video, not_in(videourl: ['', nil])
  scope :funlaile, where(:tags.in => ['FUN来了'])
  scope :wanfunlaile, where(:tags.in => ['晚FUN来了'])
  scope :wufunlaile, where(:tags.in => ['午FUN来了'])
  scope :jionggeshuoshi, where(:tags.in => ['囧哥说事'])

  scope :newer_by, lambda{|joke| where(:created_at.gt => joke.created_at).older}
  scope :older_by, lambda{|joke| where(:created_at.lt => joke.created_at).recent}

  scope :day, where(:created_at.gt => 1.day.ago)
  scope :hot, desc(:forward)
  scope :day_hot, day.hot

  taggable_on :tags

  def older
    @older ||= Joke.older_by(self).first
  end

  def newer
    @newer ||= Joke.newer_by(self).first
  end

  def is_long?
    tags.include? '长篇'
  end

  def is_short?
    tags.include? '短篇'
  end

  def is_video?
    !videourl.blank? and videourl != '0'
  end

  def is_image?
    !imgurl.blank? and imgurl != '0'
  end

  def to_youku_player_url
    videourl.gsub /.*id_([^\.]+).html.*/, 'http://player.youku.com/player.php/sid/\1/v.swf'
  end

  def title
    if read_attribute(:title)
      @title = read_attribute(:title)
    else
      @title = is_short? ? strip_for_title : name
      update_attribute :title, @title
    end
    @title
  end

  def strip_for_title
    "#{Joke.strip(text).block(30)}_#{name}无节操吐槽"
  end

  def description
    "#{ActionController::Base.helpers.strip_tags(text).gsub(/[ 　\n]/,'').block}_#{name}无节操吐槽"
  end

  def share_text
    description + " #笑料百出# "
  end

  def visit!
    Joke.update_counters _id, forward: 1
  end

  def show_tags
    tags - Joke.default_tags_hash.keys
  end

  def self.strip(text)
    "#{ActionController::Base.helpers.strip_tags(text).gsub(/[ \r\n]/,'')}"
  end

  def self.tags
    @tags = all.map(&:tags).flatten.uniq || []
    @tags -= %w(有图 视频 无图 长篇 轻松 短篇)
  end

  def self.tags_english_names
    %w(short long image video) # funlaile wufunlaile wanfunlaile jionggeshuoshi)
  end

  def self.default_tags_hash
    {'短篇' => 'short', '长篇' => 'long', '有图' => 'image', '视频' => 'video'}
  end
end
