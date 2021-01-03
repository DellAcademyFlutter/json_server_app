# json_server_app
Um app Flutter para treinar leitura e escrita em json server.

## Get Started
Observações importantes para execução do app:

1. Para executar o aplicativo, o usuário deve estabeleçer conexão com o json server, executando o seguinte comando no terminal: json-server --watch livros.json (note que você deve estar no caminho do arquivo [livros.json](json_server/livros.json)).

2. Caso deseje executar o app pelo emulador Android (emulador AVD), mude a URL base no arquivo consts (em [URL_BASE](lib/app/utils/consts.dart)) para URL_BASE = 'http://10.0.2.2:3000/livros'; Caso deseje executar em um smartphone, utilize 'http://192.168.0.104:3000/livros';

## Features
Este aplicativo implementa um CRUD (_Create_ (Criação), _Read_ (Consulta), _Update_ (Atualização) e _Delete_ (Destruição)) de livros utilizando um arquivo _.json_ como servidor.

1. Na tela principal, o usuário poderá:
  1. Visualizar os livros cadastrados.
  2. Pesquisar livros por titulo, autor ou ISBN.
  3. Arrastar um livro para editá-lo ou removê-lo.

2. Na tela de cadastro de livros, o usuário poderá cadastrar um livro.

## Screenshots
Home Page                  |  Cadastro Livro
:-------------------------:|:-------------------------:
(<img src="screenshots_readme/json_server_home_page" width="300">)|(<img src="screenshots_readme/json_server_cadastro_livro" width="300">)|

## Equipe desenvolvedora
1. Elias Cícero Moreira Guedes (Mentorado).
2. Antônio Honorato Moreira Guedes (Mentorado).
3. Israel Barbosa (Mentor).