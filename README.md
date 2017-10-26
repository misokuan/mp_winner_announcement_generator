# mp_winner_announcement_generator
Automates the scraping for selected winners' images, name &amp; caption and generates a code to be pasted on the website

SETTING UP GUIDE
1. Install Ruby - brew install ruby (Mac)
2. Download ChromeDriver - https://sites.google.com/a/chromium.org/chromedriver/downloads

GEMS INSTALLATION GUIDE
1. Install Selenium WebDriver - `gem install selenium-webdriver`

or

1. Install Bundler - `gem install bundler`
2. Install gems for this project - `bundle install`

-----------------------------------------------------------------

USAGE:
1. Put social media links in `mp_winner_links.txt`
2. Run 'ruby mp_winner_code_generator.rb' in terminal
3. Copy code generated in `mp_generated_code.txt`
