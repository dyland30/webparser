class WebPageDetailResource < JSONAPI::Resource
    attributes :tag, :content, :webPage_id
    has_one :web_page
    filter :web_page
end

