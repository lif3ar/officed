class Contact < ActiveRecord::Base
  include Global

  belongs_to :user
  has_many :company_taggings, dependent: :destroy
  has_many :company_tags, through: :company_taggings

  has_attached_file :contact_avatar, styles: { small: "80x80>" },
                    :storage => :ftp,
                    :path => "public_html/mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :url => "http://mighty12.com/paperclip/:attachment/:id/:style/:filename",
                    :ftp_servers => [
                        {
                            :host     => "ftp.mighty12.com",
                            :user     => "milieu",
                            :password => "ziraeprubu"
                        },
                    ],
                    :ftp_connect_timeout => 5,
                    :ftp_ignore_failing_connections => true,
                    :ftp_keep_empty_directories => true
  validates_attachment_content_type :contact_avatar, content_type: /\Aimage\/.*\Z/
end