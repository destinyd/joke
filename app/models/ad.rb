class Ad
  TYPES = {:home_top => 0, :home_mid => 1, :content_top => 10, :content_mid => 11, :content_bottom => 12, :content_left => 15, :sidebar_first => 21, :sidebar_second => 22, :sidebar_third => 23}
  include Mongoid::Document
  include Mongoid::Timestamps
  field :url, type: String
  field :content, type: String
  field :ad_type, type: Integer, default: 0
  field :finished_at, type: Date
  attr_accessible :url, :content, :ad_type, :finished_at

  scope :running, any_of({:finished_at.lt => Time.now}, {finished_at: nil})

  validates :ad_type, presence: true, uniqueness: true

  def self.types
    TYPES
  end

  def self.ids
    TYPES.invert
  end

  def self.home_top
    where(ad_type: 0).first
  end

  def self.home_mid
    where(ad_type: 1).first
  end

  def self.content_top
    where(ad_type: 10).first
  end

  def self.content_mid
    where(ad_type: 11).first
  end

  def self.content_bottom
    where(ad_type: 12).first
  end

  def self.content_left
    where(ad_type: 15).first
  end

  def self.sidebar_first
    where(ad_type: 21).first
  end

  def self.sidebar_second
    where(ad_type: 22).first
  end

  def self.sidebar_third
    where(ad_type: 23).first
  end



end
