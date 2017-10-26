require 'rubygems'
require 'selenium-webdriver'
require 'date'

generator = Thread.new {

    # Gets the date for the next Sunday
    def date_of_next(day)
      date  = Date.parse(day)
      delta = date > Date.today ? 0 : 7
      date + delta
    end

    update_date = date_of_next("Sunday").strftime("%B %d, %Y 12:00:00")

    # Gets the current week announcement number
    start_date = Date.new(2017,10,8)
    end_date = Date.new(2018,1,28)
    my_days = [0] # day of the week in 0-6. Sunday is day-of-week 0; Saturday is day-of-week 6.
    result = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}
    week_number = result.index(date_of_next("Sunday"))

    # Create array to store winners' details
    username_list = Array.new;
    caption_list = Array.new;
    image_list = Array.new;
    avatar_list = Array.new;
    platform_list = Array.new;
    prizes_list = ["Pemenang iPhone X","Pemenang iPhone 8","Pemenang iPhone 8","Pemenang iPhone 8","Pemenang iPhone 8"];

    driver = Selenium::WebDriver.for :chrome

    File.foreach('mp_winner_links.txt').each_slice(5) do |list|
        list.each_with_index { |link, index|
            driver.get link
            if link.include? "instagram"
                username = driver.find_elements(:class_name, "_2g7d5")[0].text
                caption = driver.find_element(:css, "li._ezgzd span").text.gsub("\n",' ')
                image = driver.find_element(:css, "div._4rbun img").attribute('src')
                avatar = driver.find_element(:css, "img._rewi8").attribute('src')
                platform = "fa-instagram"
            elsif link.include? "facebook"
                username = driver.find_elements(:css, "span.fwb")[0].text
                caption = driver.find_element(:css, "div.userContent").text.gsub("\n",' ')
                image = driver.find_element(:css, "div._46-h img._46-i").attribute('src')
                avatar = driver.find_element(:css, "div._38vo img").attribute('src')
                platform = "fa-facebook"
            elsif link.include? "twitter"
                username = driver.find_elements(:css, "strong.fullname.show-popup-with-id")[0].text
                caption = driver.find_element(:css, "div.js-tweet-text-container p.tweet-text").text.gsub("\n",' ')
                image = driver.find_element(:css, "div.js-adaptive-photo img").attribute('src')
                avatar = driver.find_element(:css, "img.js-action-profile-avatar").attribute('src')
                platform = "fa-twitter"
            end
            username_list.push(username)
            caption_list.push(caption)
            image_list.push(image)
            avatar_list.push(avatar)
            platform_list.push(platform)
        }
    end

    File.open('mp_generated_code.txt', 'w') { |file|
        file << "week#{week_number}: {\n"
        file << "date: new Date('#{update_date}'),\n"
        file << "title: 'Pemenang Minggu #{week_number}',\n"
        file << "post_images: #{image_list},\n"
        file << "user_images: #{avatar_list},\n"
        file << "names: #{username_list},\n"
        file << "platforms: #{platform_list},\n"
        file << "captions: #{caption_list},\n"
        file << "prizes: #{prizes_list},\n"
        file << "}\n"
    }

}

# message_log = Thread.new {
#     def log_message(file)
#         command = Array.new;
#         File.foreach(file) do |line|
#             command.push(line)
#         end
#
#         command.each { |line|
#             line.each_byte { |x|
#                 print x.chr
#                 sleep 0.008
#             }
#         }
#     end
#
#     log_message('.run')
# }

generator.join
# message_log.join
