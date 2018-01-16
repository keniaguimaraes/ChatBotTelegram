# coding: UTF-8

require 'telegram/bot'

token = '530579348:AAGvm_xoT2vxDiFZPX8XJN-T6_sIdWhv2og'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
	    case message.text
        when 'start', '/start', 'iniciar','comandos','comando', 'Comando'
        	bot.api.send_message(chat_id: message.chat.id, text: "--Comandos Básicos--
        	                                                      moodle
        	                                                      senha moodle
        	                                                      data prova
        	                                                      conteudo prova
        	                                                      nota
        	                                                      forma avaliacao
        	                                                      projeto final
        	                                                      ")
	    when 'ola','oi','hello','eai', 'olá'
	    	bot.api.send_message(chat_id: message.chat.id, text: "Olá #{message.from.first_name}! Eu sou o SWbot. Posso te ajudar em algo?
	    	                                                      Comandos Básicos
        	                                                      moodle
        	                                                      senha moodle
        	                                                      data prova
        	                                                      conteudo prova
        	                                                      nota
        	                                                      forma avaliacao
        	                                                      projeto final")
	    when 'stop', 'tchau', 'exit','sair','ok', 'obrigado'
	      bot.api.send_message(chat_id: message.chat.id, text: "Tchau #{message.from.first_name}! Até a próxima.")
	    when 'localizacao'
	    	 question = 'londes é a capital de qual país?'
	    	 # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
	    	answers =
	    	Telegram::Bot::Types::ReplyKeyboardMarkup
	    	.new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
	    	bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
	    when 'fone' 
	    	kb = [
				    Telegram::Bot::Types::KeyboardButton.new(text: 'Me passe seu numero de telefone', request_contact: true)
				   # Telegram::Bot::Types::KeyboardButton.new(text: 'Show me your location', request_location: true)
				 ]
				  markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
				 # bot.api.send_message(chat_id: message.chat.id, text: 'Hey!', reply_markup: markup)
		when 'moodle', '/moodle','Moodle','MOODLE'
		    kb = [
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'moodle', url: 'https://www.moodle.ufba.br/course/view.php?id=4102')
				      #Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Touch me', callback_data: 'touch'),
				      #Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Switch to inline', switch_inline_query: 'some text')
		         ]
		    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
	        bot.api.send_message(chat_id: message.chat.id, text: 'O link da página no moodle da nossa disciplina é esse', reply_markup: markup)
	    
	    when 'conteudo prova','assuntos prova', 'conteudo','assunto','Conteudo prova'
		    kb = [
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'node', url: 'https://nodejs.org/en/'),
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'php', url: 'https://secure.php.net/manual/pt_BR/intro-whatis.php'),
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'ruby', url: 'https://www.ruby-lang.org/pt/'),
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'html5', url: 'https://www.w3schools.com/html/html5_intro.asp'),
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'javascript', url: 'http://tableless.github.io/iniciantes/manual/js/')
		         ]
		    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
	        bot.api.send_message(chat_id: message.chat.id, text: 'Seguem alguns links dos contéudos que cairão na nossa avaliação. Vamos estudar?', reply_markup: markup)    
	    when 'data prova','data avaliacao','Data prova','Data avaliacao'
	    	bot.api.send_message(chat_id: message.chat.id, text: "Nossa avalição será na data 09/01/2017, no laboratorio 143")
	    when 'forma avaliacao','Forma avaliacao', 'forma avaliação', 'Forma avaliação'
	    	bot.api.send_message(chat_id: message.chat.id, text: "Como avaliação para nossa disciplina utilizaremos de:
	    	                                                       * Whorkshop+Atividades
	    	                                                       * Avaliação
	    	                                                       * Projeto Final") 	
	    when 'nota', 'Nota', 'notas', 'Notas'
	        bot.api.send_message(chat_id: message.chat.id, text: "Em configuração")
	    when 'projeto final', 'Projeto final'
	        bot.api.send_message(chat_id: message.chat.id, text: "Em configuração")    
	    end
  end
end



