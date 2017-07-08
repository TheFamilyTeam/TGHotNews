require 'telegram/bot'

class Main
  require 'net/http'
  #
  #   MODIFY HERE THE BOT SETTINGS
  #
  token = 'Bot Token'
  chatId = 'Chat Id'
  #
  #   DON'T MODIFY NOTHING HERE UNLESS YOU KNOW WHAT YOU'RE DOING
  #
  listofnews = 'null'
  Telegram::Bot::Client.run(token) do |bot|
    ansa = Thread.new {
      while (true) do
        url = URI.parse('http://www.ansa.it/')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        risposta = res.body
        array = risposta.split('</em><h3><a href="')
        urlnuovo = array[1].split('"')
        url = URI.parse('http://www.ansa.it' << urlnuovo[0])
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        risposta2 = res.body
        titleplusothercode = risposta2.split('<h1 itemprop="headline" class="news-title">')[1]
        titlewithoutcode = titleplusothercode.split('</h1>')[0]
        descriptionwithcode = risposta2.split('<h2 class="news-stit">')[1]
        descriptionwithoutcode = descriptionwithcode.split('</h2>')[0]
        if (listofnews.include?(urlnuovo[0]))
        else
          bot.api.send_message(chat_id: chatId, text: "(ANSA) " << titlewithoutcode << " - " << descriptionwithoutcode << "\r\n" << 'http://www.ansa.it' << urlnuovo[0])
          listofnews += ' ' << urlnuovo[0]
        end
        sleep 5
      end
    }
    rainews = Thread.new {
      while (true) do
        url = URI.parse('http://www.rainews.it/')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        risposta = res.body
        array = risposta.split('</span><a href="')
        urlnuovo = "http://www.rainews.it" << array[1].split('"')[0]

        titlewithshit = risposta.split('</span><a href="/dl/rainews/articoli/ContentItem-')[1]
        titlewithcode = titlewithshit.split('">')[1]
        title = titlewithcode.split('</a>')[0]
        if (listofnews.include?(urlnuovo))
        else
          bot.api.send_message(chat_id: chatId, text: "(RAI) " << title << "\r\n" << urlnuovo)
          listofnews += ' ' << urlnuovo
        end
        sleep 5
      end
    }
  end
  while (true) do
  end
end