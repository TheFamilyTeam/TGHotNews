# NewsBot
A little bot written in Ruby for Telegram that posts automatically news in Italian obtained from ANSA and Rai News. 
This project makes use of the <a href="https://github.com/atipugin/telegram-bot-ruby">telegram-bot-ruby</a> wrapper for Telegram Bots.

In order to allow this to work, you need <b>Ruby</b> installed in your PC and <b>Bundler</b>.
You can find Ruby at those links:

* <a href="https://rubyinstaller.org/">RubyInstaller for Windows</a>
* <a href="https://www.ruby-lang.org/it/downloads/">Ruby for Linux</a> (it's installed by default in many distributions)

Installing Bundler it's really easy, just run the code below in your command line:
```
$ gem install bundler
```

Also configuring the Bot it's easy, there's only to modify the Bot Token (which you can obtain by <a href="https://core.telegram.org/bots#6-botfather">making a Bot through BotFather</a>) and the Chat ID.
