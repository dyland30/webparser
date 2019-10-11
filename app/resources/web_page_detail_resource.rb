class WebPageDetailResource < JSONAPI::Resource
    attributes :tag, :content
    has_one :web_page
    filter :web_page
end

