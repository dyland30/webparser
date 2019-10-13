require 'open-uri'
class ParserController < ApplicationController

    def parse_web_site
        url = params[:weburl]

        page_id = 0
        puts url
        if url
            file = open(url)
            #contents = file.read

            lines = []

            file.each_line do |line|
                if line.include? "<title>" or line.include? "<h1" or line.include? "<h2" or line.include? "<h3" or line.include? "<h4" or line.include? "<h5"  or line.include? "<a href" 
                    lines.push(line)
                    
                end
            end
            ActiveRecord::Base.transaction do
                lines.each do |line|
                    stitle = "not specified"
                    #create webpage register an then the details
                    #assuming there is only one title per website
                    if line.include? "<title>"
                        line.slice! "<title>"
                        line.slice! "</title>"
                        stitle = line
                        page = WebPage.new(surl: url, title: stitle)
                        page.save()
                        page_id = page.id
                    elsif line.include? "<a href"
                        #extract only the link and save it into the db
                        substr = line[line.index('"')+1,line.size()-1]
                        link = substr[0,substr.index('"')]
                        #puts "LINK:::::" +link
                        puts "PAGE ID::::" +page_id.to_s
                        stag = "a href"
                        detail = WebPageDetail.new(tag:stag, content: link, webPage_id: page_id)
                        detail.save()
                        #puts detail.id
                    else
                        #revisar
                        if line 
                            puts "OTROS TAG::::::::::::" + line
                            stag = line[line.index('<')+1,line.index('>')-1]
                            puts "STAG:::"+stag
                            cont = line[line.index('>')+1, line.size()-1]
                            cont = cont[0, cont.index('<')]
                            puts "CONTENT:::"+cont
                            detail = WebPageDetail.new(tag:stag, content: cont, webPage_id: page_id)
                            detail.save()
                        end                        
                    end
                 #puts line
                end
            end
        end
        head :no_content

    end

end
