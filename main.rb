# coding: UTF-8

require 'telegram/bot'

token = ENV['TOKEN_TELEGRAM']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
	    case message.text
      when '/start','start', 'Start', 'Iniciar','iniciar','comandos','comando', 'Comando','Comandos'
        	bot.api.send_message(chat_id: message.chat.id, text: "Comandos Básicos
                                                                comando ou iniciar
        	                                                      moodle
        	                                                      senha moodle
        	                                                      data prova
        	                                                      conteudo prova
                                                                nota
                                                                forma avaliacao
                                                                projeto final descricao
                                                                projeto final itens
                                                                projeto final prazo
                                                                projeto final avaliacao
                                                                projeto final lista projetos
        	                                                      ")
	    when 'ola','oi','hello','eai', 'olá','Ola','Oi','Hello','Eai', 'Olá'
	    	bot.api.send_message(chat_id: message.chat.id, text: "Olá #{message.from.first_name}! Eu sou o SWbot. Posso te ajudar em algo?
	    	                                                      Comandos Básicos
                                                                comando ou iniciar
        	                                                      moodle
        	                                                      senha moodle
        	                                                      data prova
        	                                                      conteudo prova
        	                                                      nota
        	                                                      forma avaliacao
                                                                projeto final descricao
                                                                projeto final itens
                                                                projeto final prazo
                                                                projeto final avaliacao
                                                                projeto final lista projetos
                                                                ")
	    when 'stop', 'tchau', 'exit','sair','ok', 'obrigado','Stop', 'Tchau', 'Exit','Sair','Ok', 'Obrigado'
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
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'link moodle', url: 'https://www.moodle.ufba.br/course/view.php?id=4102')
				      #Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Touch me', callback_data: 'touch'),
				      #Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Switch to inline', switch_inline_query: 'some text')
		         ]
		    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
	        bot.api.send_message(chat_id: message.chat.id, text: 'Para realizar a inscrição na disciplna acesse o link da página no moodle:', reply_markup: markup)
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
	    	                                                      Whorkshop 20%
                                                              Atividades ?
	    	                                                      Avaliação 40%
	    	                                                      Projeto Final 40%
                                                              Participação ?")
	    when 'nota', 'Nota', 'notas', 'Notas'
		        kb = [
		               Telegram::Bot::Types::InlineKeyboardButton.new(text: 'notas', url: 'https://docs.google.com/spreadsheets/d/19p0K_p4alm3pVzHm-Z35IAXmCJLCIiq5LLRdo98eOv4/edit?usp=sharing')
		             ]
		        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
		        bot.api.send_message(chat_id: message.chat.id, text: 'A planilha de notas encontra no link', reply_markup: markup)
		
		when '  projeto final lista projetos', 'Projeto final lista projetos'
	   		    kb = [
				      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'lista temas', url: 'https://docs.google.com/spreadsheets/d/1D7jgU9kQlxgsKXB9su8eIJZNVUdKvgEhqqr9RvvyZkk/edit#gid=0')
		         ]
		        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
	            bot.api.send_message(chat_id: message.chat.id, text: 'A lista com titulos do projeto final se encontra no link', reply_markup: markup)
	
		when 'Senha moodle','senha moodle'
		        bot.api.send_message(chat_id: message.chat.id, text: "A senha para acesso ao moodle da disciplina é sisweb. Acesse o curso e vamos aos estudos! :) ")
	    when 'projeto final descricao', 'Projeto final descricao'
	        bot.api.send_message(chat_id: message.chat.id, text: "O projeto final da disciplina consiste na escolha de um tema livre e deverá ser desenvolvido um Sistema Web.
	                                                              O projeto poderá ser desenvolvido individualmente, em dupla ou trio (quanto mais alunos na equipe, mais criteriosa será a avaliação).
	                                                              Cada equipe/aluno escolherá a arquitetura e a tech stack da solução.
	                                                              A aprovação do tema será feita pela professora a partir de uma conversa com a equipe/aluno, baseado nos critérios de ser relevante e/ou inovador.  ")
	    when 'projeto final prazo', 'Projeto final prazo'
	         bot.api.send_message(chat_id: message.chat.id, text: "O link do repositório do projeto e a apresentação do sistema  deverão ser enviados até o dia 16/02/2018 no e-mail da professora. As apresentações dos projetos serão nos dias 16 e 21 de fevereiro de 2018.")
	    when 'projeto final itens', 'Projeto final itens'
	            bot.api.send_message(chat_id: message.chat.id, text: "Deverão ser entregues o link do repositório da aplicação e apresentação que será utilizada para demonstração do sistema.")
	    when 'projeto final avaliacao', 'Projeto final avaliacao'
	          bot.api.send_message(chat_id: message.chat.id, text: "O projeto final será apresentado para toda a turma nos dias 16 e 21 de fevereiro. Após a apresentação serão realizadas perguntas sobre o código pela professora.")
	    end
  end
end
