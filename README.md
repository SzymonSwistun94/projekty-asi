### Szymon Świstun

- [link do wdrożonej na zewnętrznym serwerze aplikacji](https://proj1-ror.herokuapp.com/)

* ruby 2.3.3
* rails 5.0.2
* Postgresql

Strona służy do przechowywania i udostępniania notatek.
Wkład własny:
* permalinki - funkcja pozwalająca na uzyskanie linku 
jednoznacznie prowadzącego do notatki. Ponadto możliwe jest
 ustalenie, czy przy pomocy linku dostęp może uzyskać ktoś 
 poza autorem oraz czy będzie się ona wyświetlać na liście
 dla osób poza nim.

Gemy:
* materialize-sass - wygląd,
* devise - logowanie,
* redcarpet - parser Markdown,
* clipboard-rails - kopiowanie tekstu do schowka.

Problemy:
* na Heroku nie działa rozwijane menu używane na urządzeniach
z średnim lub małym ekranem. Lokalnie i na Cloud9 problem 
nie występuje. 