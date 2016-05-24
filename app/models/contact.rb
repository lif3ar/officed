class Contact < ActiveRecord::Base
  belongs_to :user

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
