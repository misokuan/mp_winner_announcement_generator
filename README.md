# MP Winner Announcement Generator
Automates the scraping for selected winners' images, name &amp; caption and generates a code to be pasted on the website

## Setting Up

### Ruby & ChromeDriver Installation
Install Ruby (Mac):
```
brew install ruby
```
Download ChromeDriver:
```
https://sites.google.com/a/chromium.org/chromedriver/downloads
```

### Gems Installation
Install Selenium WebDriver:
```
gem install selenium-webdriver
```

OR

Install Bundler:
```
gem install bundler
```
And then install gems for this project
```
bundle install
```

## Usage
1. Put social media links in `mp_winner_links.txt`
2. Run 'ruby mp_winner_code_generator.rb' in terminal
3. Copy code generated in `mp_generated_code.txt`
