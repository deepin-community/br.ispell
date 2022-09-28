#
# Makefile para o br.ispell
#

#
#   targets principais:
#   -------------------
#
#   make br.base     produz o dicion�rio base
#
#   targets espec�ficos para o ispell:
#   ----------------------------------
#
#   make br.ispell   produz o arquivo de ra�zes para o ispell
#   make br.aff      produz o arquivo de afixos para o ispell
#   make br.hash     produz o arquivo de afixos para o ispell
#
#   targets para os outros verificadores:
#   -------------------------------------
#
#   make aspell      gera o arquivo pt_BR para o aspell
#   make myspell     gera arquivos pt_BR.dic e pt_BR.aff
#
#   Obs. n�o h� target para instalar esses arquivos. Eles
#   ter�o que ser manualmente copiados para os diret�rios onde o
#   aspell e o myspell esperam encontr�-los.
#
#   outros:
#   -------
#
#   make formas      gera a lista de todas as palavras (formas)
#   make silabas     cria o silab�rio
#   make paradigmas  mostra os paradigmas em ordem de uso
#   make testes      roda todos os testes
#   make install     instala o hash do ispell e o conjugue
#   make FAQ         constr�i o �ndice do FAQ
#

#
# SE��O DE CONFIGURA��O
# ---------------------
#

#
# Escolha os paths que ser�o utilizados para instalar os arquivos
# e configurar as ferramentas.
#
#   HASHDIR - aqui ser� colocado o br.hash
#   BINDIR  - aqui ser� colocado o conjugue
#   VDIR    - aqui ser� colocado o banco de verbos
#   MANDIR  - aqui ser� colocada a man page do conjugue
#
prefix=/usr/local
BINDIR=$(prefix)/bin
HASHDIR=/usr/lib/ispell
VDIR=$(prefix)/lib
MANDIR=$(prefix)/man

#
# Escolha o interpretador awk a ser utilizado.
#
# OBS. Muito provavelmente o conjugador de verbos n�o operar�
# corretamente se o interpretador n�o for o gawk. A partir da
# vers�o 3.0 do br.ispell, o conjugador assume que a fun��o
# toupper do interpretador � compat�vel com ISO-8859-1.
#
AWK=/usr/bin/gawk

#
# Daqui para baixo procure n�o mexer mais em nada
#

all: br.aff br.base br.ispell br.hash aspell myspell

#
# Constr�i o dicion�rio base
#
br.base: E-2.5 E-Raul E-Rodrigo E-Osmar E-outras conjugue verbos fl br.aff
	echo origens >br.base.tmp
	echo 1 br.ispell 2.5 >>br.base.tmp
	echo >>br.base.tmp
	echo paradigmas verbais >>br.base.tmp
	$(AWK) -f ./conjugue -v BANCO=verbos -v FORMATO=b >>br.base.tmp
	echo >>br.base.tmp
	./fl -E E-2.5 >>br.base.tmp
	mv -f br.base.tmp br.base
	./fl -E E-Raul >br.base.tmp
	mv -f br.base.tmp br.base
	./fl -E E-Osmar >br.base.tmp
	mv -f br.base.tmp br.base
	./fl -E E-Rodrigo >br.base.tmp
	mv -f br.base.tmp br.base
	./fl -E E-outras >br.base.tmp
	mv -f br.base.tmp br.base
	$(AWK) -f ./conjugue -v BANCO=verbos -v FORMATO=b -v CMD=T >>br.base

#
# Flexiona a lista do Rodrigo
#
E-Rodrigo: L-Rodrigo
	./fl -F <L-Rodrigo >E-Rodrigo

#
# Constr�i o arquivo de afixos
#
br.aff: br.aff.nv conjugue verbos
	$(AWK) -f ./conjugue -v BANCO=verbos -v FORMATO=aa -v CMD=T >v.rules
	cat br.aff.nv v.rules >br.aff
	rm -f v.rules

#
# Gera as conjuga��es de todos os verbos, com o resultado
# fatorado pelas flags do br.aff.
#
v.ispell: conjugue verbos
	$(AWK) -f ./conjugue -v BANCO=verbos -v FORMATO=ci -v CMD=T >v.ispell

#
# Constr�i o vocabul�rio total fatorado com as flags do br.aff.
#
# Acrescenta as formas que o ispell n�o consegue obter atrav�s
# da tabela de afixos.
#
# H� um bug no fl que produz nenhum/A ao inv�s de nenhum/H. N�o
# sabemos ainda resolver ao n�vel do fl.
#
br.ispell: v.ispell br.base fl br.aff
	./fl -l >br.ispell.tmp
	cat v.ispell >>br.ispell.tmp
	sort br.ispell.tmp | uniq >br.ispell
	./fl -I >>br.ispell.tmp
	echo "os" >>br.ispell.tmp
	echo "as" >>br.ispell.tmp
	sort br.ispell.tmp | sed 's/^nenhum\/A/nenhum\/H/' | uniq >br.ispell
	rm -f br.ispell.tmp

#
# Gera o vocabulario total, flexionado com as flags do br.aff.
#
br.hash: br.aff br.ispell
	buildhash br.ispell br.aff br.hash

#
# Instala o br.hash
#
install-hash: br.ispell
	install -d $(HASHDIR)
	install --mode=644 br.hash br.aff $(HASHDIR)

#
# Instala o conjugue, substituindo antes os paths default pelos
# que tiverem sido especificados acima.
#
install-conjugue:
	sed -e 's|/usr/bin/awk|$(AWK)|g' -e \
	's|/usr/local/lib/verbos|$(VDIR)/verbos|g' conjugue >conjugue.tmp
	chmod 755 conjugue.tmp
	mv -f conjugue.tmp conjugue
	sed -e 's|/usr/local/lib|$(VDIR)|g' conjugue.1 >conjugue.1.tmp
	chmod 644 conjugue.1.tmp
	mv -f conjugue.1.tmp conjugue.1
	touch conjugue-stamp
	install -d $(BINDIR)
	install --mode=755 conjugue $(BINDIR)/conjugue
	install -d $(VDIR)
	install --mode=644 verbos $(VDIR)/verbos
	install -d $(MANDIR)/man1
	install --mode=644 conjugue.1 $(MANDIR)/man1/conjugue.1

#
# instala o conjugue e o hash do ispell
#
install: install-hash install-conjugue

#
# Gera o vocabul�rio flexionado a partir do br.hash.
#
formas: br.hash
	cat br.ispell | ispell -e -d ./br.hash | tr " " "\n" |sort|\
            uniq >formas

#
# Constr�i o silab�rio. Isso exige uma m�quina com bastante
# mem�ria. Numa m�quina mais simples pode ser poss�vel a constru��o
# utilizando-se arquivos intermedi�rios ao inv�s de pipes.
#
silabas: fl formas
	./fl -s - <formas | tr '\-' "\n"| sort | uniq >silabas

#
# Constr�i o �ndice do FAQ.
#
FAQ-stamp:
	rm -f FAQ
FAQ: FAQ-stamp
	grep '^@ ' FAQ.i | sed 's/^@ //' > FAQ
	echo >>FAQ
	echo �NDICE >>FAQ
	egrep "^(SE��O|[1-9]+\.[1-9]+)" FAQ.i | \
	$(AWK) '{ if (/^S/) { print ""; print } else print "  " $$0 }' >>FAQ
	grep -v '^@ ' FAQ.i >>FAQ

#
# SUPORTE A OUTROS VERIFICADORES
# ------------------------------
#
aspell: formas
	aspell --lang=pt_BR create master ./pt_BR <formas 

myspell: br.base br.aff br.ispell
	./afftoOOo >pt_BR.aff
	cat br.ispell|wc -l|tr -d ' ' >pt_BR.dic
	cat br.ispell >>pt_BR.dic

#
# GERA��O DE AN�LISES E/OU ESTAT�STICAS
# -------------------------------------
#

#
# Obten��o (aproximada) de estat�sticas.
#
stats: br.ispell
	( n=`cat br.ispell | wc -l` ; \
	echo aproximadamente $$n lemas ou ra�zes )
	./conjugue -v BANCO=verbos </dev/null | \
	grep lidos | \
	sed 's/lidos //' | \
	sed 's/paradigmas/paradigmas verbais/'

#
# Lista todos os paradigmas em uso e o n�mero de vezes que cada
# um � utilizado.
#
# (n�o estou muito certo se esse target ainda funciona)
#
paradigmas: conjugue
	$(AWK) -f conjugue -v BANCO=verbos -v FORMATO=n -v CMD=T|\
            grep paradigma|sed 's/ deduzido//'|sort|uniq -c|sort -n

#
# TESTES
# ------
#

#
# Erros do separador de s�labas.
#
teste_sep:
	./fl -v -s - <testesep | grep errou

#
# Encontros voc�licos n�o previstos no separador de s�labas.
#
teste_ev:
	./fl -v -S | grep -i imprevisto | sort | uniq

#
# Confronto das formas geradas pelo conjugador com as formas geradas
# via arquivo de afixos.
#
teste_v:
	echo Essa op��o ainda n�o est� implementada

#
# roda todos os testes
#
testes: teste_v teste_sep teste_ev

#
# Remove todos os arquivos constru�dos.
#
clean:
	rm -f v.tmp br.tmp palavras.tmp br.base.tmp
	rm -f br.aff br.hash br.ispell.cnt br.ispell.stat
	rm -f v.ispell br.ispell br.ispell.tmp
	rm -f formas
	rm -f conjugue-stamp
	rm -f pt_BR.dic pt_BR.aff
	rm -f silabas br.base br.aff
	rm -f pt_BR
	rm -f E-Rodrigo
	rm -f FAQ
	rm -f *~
