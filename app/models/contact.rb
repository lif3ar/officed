class Contact < ActiveRecord::Base
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

  def all_company_tags=(names)
    self.company_tags = names.split(',').map do |name|
      CompanyTag.where(name: name).first_or_create!
    end
  end

  def all_company_tags
    company_tags.map(&:name).join(',')
  end

end
