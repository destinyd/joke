class JokeOffer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  extend Enumerize
  #include Mongoid::Enum

  field :title, type: String
  field :text, type: String
  enumerize :status, in: [:pending, :approved, :declined], default: :pending
  #enum :status, [:pending, :approved, :declined], default: :pending
  mount_uploader :image, ImageUploader
  taggable_on :tags
  belongs_to :user
  belongs_to :joke

  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true

  scope :recent, -> {desc(:created_at)}

  def is_image?
    !image.blank?
  end

  def human_status
    return case status
    when :pending
      '审核中'
    when :approved
      '已审核'
    when :declined
      '已悲剧'
    end
  end

  def human_title
    title + '(' + human_status + ')'
  end

  after_update :build_joke
  def build_joke
    if !self.joke and status == :approved
      tmp_tags = (tags || []).push('原创', '短篇')
      tmp_tags.push('有图') unless image.blank?
      self.joke = Joke.create(title: title, text: text, joke_id: id, imgurl: image_url, name: user.try(:name), tag_list: tmp_tags.uniq.join(','))
      save
    end
  end
end
