@ FAQ do br.ispell
@ �ltima atualiza��o 2nov2002
@ envie sugest�es e cr�ticas para ueda@ime.usp.br

SE��O 1 - Entendendo o br.ispell

1.1 O que � coberto por esta se��o do FAQ?

A se��o "entendendo o br.ispell" explica o que � um verificador
e, sem entrar em detalhes t�cnicos, para que serve o br.ispell e
como ele vem sendo desenvolvido.

1.2 O que � um verificador ortogr�fico?

O melhor modo de saber o que � um verificador ortogr�fico � usar
algum deles ao redigir um documento. Se voc� n�o souber fazer
isso, pe�a ajuda para algum colega que saiba, e voc� entender�
rapidamente o funcionamento. Ao aplicar o verificador no
documento, ele examinar� cada palavra e indicar� aquelas cuja
ortografia est� incorreta, sugerindo alternativas.

1.3 Como funciona um verificador ortogr�fico?

Os verificadores ortogr�ficos s�o programas relativamente
simples. Eles possuem uma lista de palavras consideradas corretas
e, para cada palavra de um texto, testam se ela ocorre ou n�o na
lista. Se ocorrer, a ortografia � admitida correta. Caso
contr�rio ela ser� considerada incorreta.

1.4 O que � o dicion�rio?

� a lista das palavras consideradas corretas pelo verificador.

1.5 Portanto � necess�rio levantar todas as palavras da l�ngua?

Sim, mas como os verificadores s�o programas simples, �
necess�rio tamb�m que o dicion�rio seja flexionado.

Dicion�rios da l�ngua como o Aur�lio ou o Houaiss, e vocabul�rios
como o VOLP da Academia Brasileira de Letras, trazem apenas o
lema de cada palavra, isto �, a forma atrav�s da qual ela �
consultada. Por exemplo: "menino". Mas o dicion�rio de um
verificador necessita explicitar cada uma das flex�es: menino,
menina, meninos, meninas, menininho, etc. O dicion�rio de um
verificador deve incluir tamb�m todas as formas verbais ("amo",
"amas", "ama", etc), e outras palavras que via de regra n�o
constam dos dicion�rios da l�ngua, como os nomes pr�prios
("Jo�o", "M�xico", etc).

1.6 O que � o br.ispell?

O br.ispell � um dicion�rio de livre uso constru�do
cooperativamente que pode ser utilizado por v�rios verificadores
diferentes. Sua constru��o foi iniciada em 1995, o seu uso vem
difundindo-se ao longo dos anos, e os trabalhos de depura��o e
aperfei�oamento prosseguem.

1.7 Como obter o br.ispell?

O br.ispell est� dispon�vel no endere�o

    http://www.ime.usp.br/~ueda/br.ispell

1.8 Quais verificadores ortogr�ficos o br.ispell suporta?

O br.ispell pode ser utilizado com o ispell, o aspell e o
myspell. Aplica��es como o Mozilla, o OpenOffice, o Emacs ou
outras suportam um ou mais desses verificadores. Assim, o
br.ispell pode ser utilizado normalmente nesses e em muitas
outras aplica��es.

1.9 O br.ispell funciona no Windows?

O br.ispell foi desenvolvido em sistemas do tipo Unix, mas ele
pode ser utilizado normalmente no Windows, pelas aplica��es que
suportarem ispell, aspell ou myspell (por exemplo o OpenOffice).

1.10 Como usar o br.ispell?

Para a maior parte das pessoas, o uso do br.ispell �
transparente. Ele acompanha v�rios sistemas operacionais livres,
pronto para uso. Entretanto, no caso de alguns programas ou
sistemas poder� haver necessidade de gerar ou obter alguns
arquivos, instal�-los convenientemente, ou configurar programas
ou ambientes. A documenta��o do br.ispell n�o cobre todos esses
detalhes, mas inclui algumas dicas (veja a se��o de dicas deste
FAQ se houver necessidade).

1.11 O br.ispell inclui todas as palavras do portugu�s?

N�o. � imposs�vel levantar todas as palavras de uma l�ngua,
porque a l�ngua est� continuamente em transforma��o. Al�m do
mais, nem � conveniente incluir todas as palavras, porque as
palavras de uso raro geram falsos positivos. Por exemplo: "carme"
significa "verso" ou "poesia". Os latinistas ficar�o contentes se
"carme" for adicionada ao dicion�rio. Mas para todas as outras
pessoas que nunca usam essa palavra ela s� atrapalhar�, porque se
por deslize escreverem "carme" ao inv�s de "carne", o verificador
n�o detetar� o erro ortogr�fico.

1.12 Que tal copiar as palavras de um dicion�rio eletr�nico?

Independentemente dessa opera��o ser ou n�o tecnicamente
poss�vel, copiar todas as palavras da edi��o eletr�nica de um
dicion�rio da l�ngua como o Aur�lio � provavelmente ilegal. Al�m
do mais � pouco �til porque conforme j� explicado, o verificador
necessita que as palavras estejam flexionadas (flexionar as
palavras � geralmente mais trabalhoso do que levant�-las). Pior
ainda, pode prejudicar a verifica��o, em virtude dos falsos
positivos.

1.13 Ent�o, como fazer?

A constru��o do dicion�rio n�o deve limitar-se a ir acumulando
palavras numa lista gigantesca. O levantamento do l�xico deve ser
feito de forma gradual e estruturada, a fim de tornar poss�vel o
trabalho de depura��o.

Por exemplo: a depura��o manual de uma lista de dezenas de
milhares de palavras, uma a uma, � um trabalho insano. Mas a
revis�o de uma lista de infinitivos verbais e de um paradigma de
conjuga��o que se aplica a dezenas ou centenas de verbos � um
trabalho bem mais simples.

1.14 Qual � a estrat�gia de desenvolvimento adotada pelo br.ispell?

O dicion�rio br.ispell estrutura o seu conte�do em v�rios
n�veis. O mais fundamental � a separa��o de verbos e n�o
verbos. Os verbos s�o conjugados de forma autom�tica, a fim de
gerar todas as formas para o verificador. As outras palavras s�o
flexionadas de forma semi-autom�tica, atrav�s de uma
classifica��o sem�ntica e gramatical, e da anota��o das
entradas. O conte�do b�sico do br.ispell � formado apenas por
palavras de uso comum no Brasil, a fim de evitar o problema dos
falsos positivos. As palavras de uso raro est�o sendo adicionadas
de forma modular, a fim de que possam ser removidas em bloco se
houver necessidade. Mais palavras v�o sendo adicionadas
paulatinamente, � medida em que v�o sendo contribu�das. Outros
recursos de granularidade mais fina est�o dispon�veis tamb�m.

1.15 Isso n�o � complicado demais?

Ao lidar com a l�ngua, a complexidade � inevit�vel. A constru��o
do br.ispell vem sendo trabalhosa para todas as pessoas que se
dispuseram a investir esfor�os nele. Em contrapartida, o
resultado tem qualidade e est� livremente dispon�vel.

1.16 Como posso ajudar nesse trabalho?

Ao longo dos anos, a colabora��o com esses trabalhos vem
acontecendo por iniciativa das pessoas que obt�m o pacote na
Internet, usam-no, entendem os aspectos fundamentais do
funcionamento, e detetam e corrigem problemas, tanto ao n�vel do
c�digo dos programas que acompanham o pacote, quanto ao n�vel do
conte�do lexical.

O projeto vem tentando materializar formas de colabora��o que
dependam menos do conhecimento espec�fico do pacote. Isso est�
acontecendo na forma de um sistema online que ainda � preliminar
mas j� est� dispon�vel no endere�o provis�rio

    http://www.claraocr.orb/br.ispell

A finalidade b�sica desse sistema � permitir que palavras n�o
reconhecidas pelo verificador sejam adicionadas. Ele permite
tamb�m que a palavra seja anotada (exemplo: indicar a sua classe
gramatical). A anota��o n�o � obrigat�ria mas � �til.

Um outro modo, concreto e simples de colaborar � contribuir
textos revisados, que possam ser utilizados tanto para
levantamento de vocabul�rio quanto para testes do verificador.

1.17 Quem colabora com o br.ispell abre m�o dos direitos de autor?

N�o. Materiais livres como o br.ispell preservam os direitos de
autor (copyright). O br.ispell � copyright de seus autores, ou
seja, das pessoas que o constru�ram, mas pode ser livremente
usado, alterado ou redistribu�do segundo os termos da licen�a
GPL.

1.18 O que significa o br.ispell ser GPL?

O br.ispell � um pacote que inclui programas (conjugador de
verbos, lematizador, etc) e conte�do lexical (n�o apenas uma
lista de palavras, mas tamb�m um padr�o e informa��es de flex�o,
uma classifica��o sem�ntica, tabelas para compress�o de afixos,
etc). O conjunto de programas e conte�do lexical � entendido como
o fonte, e os arquivos br.hash e pt_BR.* e quaisquer execut�veis
s�o entendidos como o objeto. O pacote � aberto e disponibilizado
sob a licen�a GNU GPL, que � a mesma que acompanha a maior parte
dos programas livres ou abertos hoje existentes. Essa licen�a
permite o livre uso, c�pia, altera��o e redistribui��o, desde que
acompanhada dos fontes e sob a mesma licen�a, isto �, a GPL, a
fim de garantir que o uso permane�a livre.

Para maiores informa��es sobre a GPL veja

    http://www.gnu.org/copyleft/gpl-faq.html

1.19 O conte�do lexical pode ser utilizado por programas n�o GPL?

Os arquivos br.hash, pt_BR.dic, pt_BR.aff e pt_BR gerados pelo
pacote s�o de uso irrestrito para fins de verifica��o
ortogr�fica. O uso desses arquivos por um verificador n�o �
entendido pelos autores do br.ispell � semelhan�a de uma
linkagem, mas � semelhan�a da comunica��o entre programas
independentes, que podem portanto ser regidos por licen�as
diversas. O mesmo princ�pio dever� ser aplicado a outros formatos
que ainda venham a ser suportados.

Note que esses arquivos n�o incluem todo o conte�do lexical do
br.ispell, mas trazem apenas a lista dos lemas, as suas flex�es e
as tabelas de compress�o de afixos. O uso e redistribui��o desses
arquivos pressup�e que eles estejam acompanhados dos fontes, isto
�, do pacote br.ispell, ou ao menos da indica��o deste de forma a
possibilitar que o pacote possa ser obtido atrav�s da Internet.


SE��O 2 - Dicas de instala��o e uso

2.1 O que � coberto por esta se��o do FAQ?

A se��o "dicas de instala��o e uso" tenta dar algumas coordenadas
para quem n�o estiver conseguindo instalar ou usar o
br.ispell. Como as situa��es pr�ticas variam muito, as dicas s�o
um pouco gen�ricas. Ser� geralmente in�til tentar contatar as
pessoas que mant�m o br.ispell solicitando suporte mais
espec�fico, porque elas n�o t�m conhecimento detalhado das
variadas aplica��es e dos diversos ambientes.

2.2 Eu preciso instalar o br.ispell?

Provavelmente n�o. O processo de instala��o de muitos sistemas
operacionais livres inclui de forma autom�tica um dicion�rio de
verifica��o do portugu�s do Brasil, pronto para uso, quando se
seleciona o portugu�s do Brasil como l�ngua de instala��o ou como
l�ngua suportada.

2.3 Como instalar o br.ispell?

Os sistemas operacionais livres geralmente trazem o br.ispell
pr�-empacotado, seja na forma de um dicion�rio para o ispell,
seja na forma de um dicion�rio para o aspell. Levante no seu
sistema operacional quais s�o as ferramentas de verifica��o
dispon�veis (ispell, aspell, myspell, ou outras) e quais
dicion�rios existem para cada uma delas. O modo de realizar essa
procura varia de acordo com o sistema operacional. Se existir um
dicion�rio do portugu�s do Brasil na forma de um pacote, ent�o
bastar� instal�-lo, se isso j� n�o tiver sido feito. O modo de
instalar um pacote depende do sistema operacional, mas geralmente
� uma tarefa simples.

Al�m disso, ser� necess�rio provavelmente avisar as aplica��es
que elas devem utilizar o dicion�rio do portugu�s do Brasil (e
n�o o de ingl�s ou de outra l�ngua). Isso normalmente � feito ou
na configura��o do desktop, ou na configura��o da aplica��o, ou
atrav�s de vari�veis de ambiente.

2.4 Ent�o eu n�o preciso baixar o arquivo br.ispell-X.Y.tar.gz?

Na maior parte dos casos n�o ser� necess�rio nem baixar esse
arquivo, e nem tentar produzir a partir dele os arquivos que o
verificador (ispell, aspell, etc.) necessita.

2.5 O meu caso � diferente

Ent�o � prov�vel que voc� n�o tenha tamb�m um verificador
ortogr�fico instalado ou pr�-empacotado. Procure levantar em
quais aplica��es (email, editores, etc) voc� deseja utilizar a
verifica��o ortogr�fica, e quais verificadores (ispell, aspell,
etc) elas suportam. Instale os verificadores, e em seguida
produza usando o br.ispell os arquivos de que eles necessitam
(por exemplo o br.hash, o pt_BR.aff, ou outros).

Para tanto, obtenha o arquivo br.ispell-X.Y.tar.gz onde X.Y � o
n�mero da vers�o mais recente, extraia o conte�do dele usando
gunzip e tar, leia no Makefile a descri��o dos targets
principais, e no prompt do shell tente produzir aqueles que forem
necess�rios. Por exemplo:

    $ make br.hash

Note que o uso do "make" pressup�e um ambiente do tipo Unix. Os
arquivos produzidos ter�o que ser copiados para diret�rios onde
os verificadores esperam encontr�-los (isso tem que ser checado
na documenta��o do verificador), e as aplica��es geralmente ter�o
que ser informadas de que a l�ngua � o portugu�s do Brasil, ou
atrav�s das op��es dos menus, ou atrav�s de vari�veis de
ambiente.

2.6 O make falhou com uma mensagem de erro

Tente obter suporte local relativo ao erro, isto �, mostre a
mensagem de erro para algum t�cnico. Em �ltimo caso, envie a
mensagem de erro para ueda@ime.usp.br.

2.7 Como usar o br.ispell no OpenOffice?

� bem simples. Siga as instru��e do mini-howto dispon�vel no
endere�o

    http://oobr.querencialivre.rs.gov.br/docajuda_dict.php

2.8 Posso gerar os arquivos no Linux e copi�-los para o Windows?

Em alguns casos sim. Por exemplo: os arquivos pt_BR.dic e
pt_BR.aff do myspell podem ser gerados no Linux e copiados para o
Windows. J� o arquivo br.hash nem sempre pode ser copiado da
m�quina onde foi criado para uma outra, sejam l� quais forem os
sistemas operacionais em uso, devido ao formato do arquivo, que
depende da forma com que o compilador aloca estruturas na
mem�ria.


SE��O 3 - Introdu��o para desenvolvedores

3.1 O que � coberto por esta se��o do FAQ?

A se��o "introdu��o para desenvolvedores" explica os arquivos
principais do br.ispell de forma simples mas dirigida a
desenvolvedores. Quem deseja apenas usar o br.ispell na
verifica��o de textos n�o necessita ler esta se��o.

3.2 O que � o arquivo br.aff?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

O ispell (e tamb�m o myspell) obt�m as formas de uma palavra
aplicando a ela regras de afixos. Por exemplo: substituir a letra
final "o" por "a" para obter a flex�o no feminino. Essa regra �
codificada assim:

    flag B:
    O  > -O,A

O arquivo br.aff cont�m todas as regras de afixos utilizadas no
br.ispell. Algumas foram compostas de forma manual, e outras de
forma autom�tica pelos programas que acompanham o pacote. De
fato, o arquivo br.aff n�o est� presente no pacote br.ispell, mas
� produzido por ele atrav�s das regras do makefile.

3.3 O que � o arquivo br.ispell?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

As palavras que se flexionam no g�nero segundo a regra
exemplificada na pergunta anterior necessitam indic�-lo de forma
expl�cita. Por exemplo:

    menino/B

No jarg�o do ispell, "menino" � chamado de raiz. A aplica��o da
regra de substitui��o da vogal final produz "menina". O arquivo
br.ispell � a lista de todas as ra�zes, cada uma indicando as
regras que a ela se aplicam. O arquivo br.ispell n�o est�
presente no pacote br.ispell, mas � produzido por ele atrav�s das
regras do makefile.

3.4 O que � o arquivo br.hash?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

O ispell constr�i com as ra�zes e as regras de afixos uma
estrutura de acesso r�pido (hash), que permite verificar se uma
dada forma (ex. "menina", "falara", etc) � ou n�o correta. Essa
estrutura � o arquivo br.hash. Ele � diretamente utilizado pelo
ispell no processo de verifica��o ortogr�fica. Geralmente ele
reside num diret�rio definido na compila��o do ispell, por
exemplo /usr/dict.

O arquivo br.hash n�o est� presente no pacote br.ispell, mas �
produzido por ele atrav�s das regras do makefile.

3.5 O que � o arquivo pt_BR.aff?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

� o arquivo br.aff traduzido para a sintaxe do myspell (veja a
pergunta "o que � o arquivo br.aff?").

O arquivo pt_BR.aff n�o est� presente no pacote br.ispell, mas �
produzido por ele atrav�s das regras do makefile.

3.6 O que � o arquivo pt_BR.dic?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

� o arquivo br.ispell precedido por uma linha informando quantas
ra�zes existem (veja a pergunta "o que � o arquivo br.aff?").

O arquivo pt_BR.dic n�o est� presente no pacote br.ispell, mas �
produzido por ele atrav�s das regras do makefile.

3.7 O myspell tamb�m constr�i um hash?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

N�o. O myspell realiza a verifica��o usando diretamente os
arquivos pt_BR.aff e pt_BR.dic.

3.8 O que � o makefile?

Obs. essa pergunta � importante apenas para quem deseja entender
o funcionamento do ispell e do myspell.

� um arquivo formado por seq��ncias de regras que produzem um
determinado resultado ("target"). O makefile do br.ispell produz
uma s�rie de arquivos necess�rios aos verificadores ortogr�ficos
a partir do conte�do lexical do br.ispell, de ferramentas do
ispell e de ferramentas do pr�prio br.ispell. Por exemplo, o
arquivo br.aff � produzido atrav�s das regras do makefile. Para
comandar a produ��o do arquivo br.aff, basta executar o seguinte
comando no diret�rio onde se encontram os arquivos do br.ispell:

    make br.hash

Obs. isso pressup�e que v�rias ferramentas t�picas do ambiente
Unix estejam presentes no seu sistema, seja ele Unix-like ou n�o.

3.9 O que � o arquivo pt_BR?

� a lista de palavras total no formato que o aspell necessita.


SE��O 4 - O conte�do lexical do br.ispell

4.1 O que � coberto por esta se��o do FAQ?

A se��o "o conte�do lexical do br.ispell" introduz o conte�do, os
recursos e a organiza��o do br.ispell de forma independente da
opera��o de verifica��o ortogr�fica. Essa abordagem � dirigida a
linguistas e afins.

4.2 Como o conte�do lexical do br.ispell est� organizado?

O conte�do est� quase totalmente lematizado. Cada lema n�o verbal
inclui as flex�es de forma expl�cita. Por exemplo:

    menin:a,as,o,os

Os lemas n�o verbais est�o classificados semanticamente numa
forma semelhante � de obras did�ticas para estudo de
l�nguas. Exemplo:

    #
    # hortali�a [s.]
    #
    abobrinha:,s
    ab�bora:,s
    alface:,s

As formas de flex�o dos lemas n�o verbais est�o classificadas em
paradigmas. Isso pode ser encontrado na se��o "paradigmas
nominais" do arquivo br.base.

Os verbos s�o tratados � parte. O arquivo "verbos" inclui a
conjuga��o dos paradigmas e uma lista extensa de verbos. O
conjugador gera todas as formas sint�ticas de todos os verbos
relacionados, aplicando os paradigmas indicados para cada verbo,
ou deduzindo um paradigma quando n�o h� indica��o de qual
utilizar.

4.3 As palavras est�o classificadas gramaticalmente?

A classifica��o em classes gramaticais (substantivo, adjetivo,
etc.) existe mas � parcial. Al�m disso, ela foi em parte obtida
de forma autom�tica e sujeita a erros, a partir da termina��o dos
lemas (veja a op��o -F da ferramenta fl).

4.3 Qual � o formato do conte�do lexical?

O pacote inclui dois formatos principais para manter o conte�do
lexical. Um � chamado "edit�vel", e tenta ser apropriado para a
manuten��o manual do conte�do. Todos os arquivos nesse formato
t�m nomes da forma E-*.

O outro formato congrega todo conte�do lexical existente no
pacote, e � dele que se derivam os arquivos de que os
verificadores necessitam. Esse formato � chamado "dicion�rio
base", e imita mais ou menos o formato de um dicion�rio comum da
l�ngua. Ele est� descrito na documenta��o da ferramenta fl.

Todo o conte�do est� codificado em formato texto ordin�rio
(ISO-8859-1).

4.4 Esses formatos utilizam XML?

Atualmente n�o.

4.5 Quais ferramentas lexicais est�o presentes no br.ispell?

H� um conjugador de verbos, o conversor afftoOOo do arquivo de
afixos, e uma ferramenta chamada fl (ferramenta lexical). Essa
ferramenta � basicamente um manipulador de regras de afixos, mas
ele congrega uma quantidade grande de opera��es diferentes, entre
elas: lematiza��o, expans�o de formas, separa��o sil�bica e
compara��o fon�tica.

4.6 O br.ispell inclui um analisador morfol�gico?

Atualmente n�o, entretanto o pacote inclui um lematizador capaz
de obter o infinitivo dos verbos conhecidos, e o lema das formas
n�o verbais conhecidas. H� tamb�m um classificador de formas n�o
conhecidas (veja a op��o -F da ferramenta fl).

4.7 O br.ispell suporta o uso de corpora?

N�o h� atualmente nenhum suporte espec�fico para uso de corpora.

4.8 Quantos lemas h� no br.ispell? quantos paradigmas?

Esses dados podem ser obtidos de forma aproximada utilizando o
target "stats" do Makefile. Na vers�o 3.0-beta4 temos:

    $ make -s stats
    aproximadamente 43730 lemas ou ra�zes
    80 paradigmas verbais
    4006 verbos
