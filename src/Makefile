# This is a makefile that builds the kal-eng translation parser

# It should be rewritten with Twig or something similar instead of 
# the shellscript we have now

LEXC = lexc -utf8
XFST = xfst -utf8

# fst for the kal-eng dictionary

#Pseudocode:											    
#Make a lexc file:										    
#Print the first line: LEXICON Root						    
#Then, for each entry, make lines of the format kallemma:firstengtranslation # ;
#Then print the result to file.
#Then make xfst read it with the command read lexc.
# The trick is that only the first <t node may be chosen, there may be several.

kaleng.fst: ../bin/kaleng.fst ../bin/kaldic.fst
../bin/kaleng.fst: kaleng.xml  ../bin/kaleng.html
	@echo
	@echo "*** Building kaleng.fst ***" 
	@echo
	@echo "*** Reading shellscript kalengpairs.sh ***"
	@./kalengpairs.sh
	@echo
	@echo "*** Calling xfst to compile lexc ***"
	@printf "read lexc < ../bin/ke.lexc \n\
	save ../bin/ikaleng.fst \n\
	invert net \n\
	save ../bin/kaleng.fst \n\
	quit \n" > ../../tmp/kaleng-save-script
	$(XFST) < ../../tmp/kaleng-save-script
	@rm -rf ../../tmp/kaleng-save-script

kaleng.html: ../bin/kaleng.html
../bin/kaleng.html: kaleng.xml ../../scripts/gt_dictionary.xsl
	@echo
	@echo "*** Building kaleng.html ***" 
	@echo
	@echo "*** Note: We now use the xsltproc tool ***"
	@xsltproc ../../scripts/gt_dictionary.xsl kaleng.xml > ../bin/kaleng.html

# fst for the Kalaalisut words in the dictionary

#Pseudocode:
#Pick the lemmas, and print them to list
#Read the list into xfst
#Save as an automaton.

# The perlscript for glossing should use kaleng.lexc or something similar.

kaldic.fst: ../bin/kaldic.fst
../bin/kaldic.fst: kaleng.xml
	@echo
	@echo "*** Building kaldic.fst ***" 
	@echo
	@cat kaleng.xml | grep '<l>' | cut -d">" -f2 | cut -d"<" -f1 > ../bin/k.dic
	@printf "read text < ../bin/k.dic \n\
	save stack ../bin/kaldic.fst \n\
	quit \n" > ../../tmp/kaldic-save-script
	$(XFST) < ../../tmp/kaldic-save-script
	@rm -rf ../../tmp/kaldic-save-script

clean:
	@rm -f ../bin/*


