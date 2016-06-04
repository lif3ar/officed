class Contact < ActiveRecord::Base
  include PublicActivity::Common
  include Global

  belongs_to :user
  has_many :company_taggings, dependent: :destroy
  has_many :company_tags, through: :company_taggings

  has_attached_file :contact_avatar, styles: { small: "80x80>" },
                    default_url: "/contact_avatars/:style/missing.png",
                    :storage => :ftp,
                    :path => "public_html/mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :url => "http://mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :ftp_servers => [
                        {
                            :host     => "ftp.mighty12.com",
                            :user     => "milieu",
                            :password => "ziraeprubu",
                            :passive  => true
                        },
                    ],
                    :ftp_connect_timeout => 5,
                    :ftp_ignore_failing_connections => true,
                    :ftp_keep_empty_directories => true

  validates_attachment_content_type :contact_avatar, content_type: /\Aimage\/.*\Z/

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
  end
end