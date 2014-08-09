class Apk
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :version, type: String, default: '1.01'
  field :update_info, type: String, default: ''
  mount_uploader :apk, ApkUploader

  validates :apk, presence: true

  scope :recent, desc(:created_at)
  scope :download, desc(:order).desc(:created_at)

  def updated_version
    update_attribute :version, (self.version.to_f + 0.01).to_s
  end
end
