Some observation while indeting and normalizing data:

out_put>g '<t' kaleng.xml |g -v '<tg'|g -v '<t/>'|c
   18190
out_put>g '<t' kaleng.xml |g -v '<tg'|g '<t/>'|c
    1801

 ==> 1801 empty t-elements: Such kind of "data" should be filtered out from the lexc-file compilation.
 TODO-issue 

