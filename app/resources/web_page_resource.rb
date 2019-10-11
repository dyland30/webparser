class WebPageResource < JSONAPI::Resource 
    attributes :surl, :title
    has_many :web_page_details

end
