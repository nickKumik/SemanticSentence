%2016290 - Nicholas Kumik
s(s(NP,VP)) --> np(subject,Number,Person,Anamicy,NP),vp(Number,Person,Anamicy,VP).
%np
np(Role,Number,Person,_,np(Pro))-->pro(Role,Number,Person,Pro).
np(_,Number,third,Anamicy,np(Det,Nbar))-->det(Number,Det),nbar(Number,Anamicy,Nbar).
np(_,Number,third,Anamicy,np(Det,Nbar,PP))-->det(Number,Det),nbar(Number,Anamicy,Nbar),pp(PP).
%vp
vp(Number,Person,Anamicy,vp(V,NP))-->v(tv,Number,Person,Anamicy,V),np(object,_,_,_,NP).
vp(Number,Person,Anamicy,vp(V))-->v(iv,Number,Person,Anamicy,V).
%nbar
nbar(Number,Anamicy,nbar(N))-->n(Number,Anamicy,N).
nbar(Number,_,nbar(JP))-->jp(Number,JP).
%jp
jp(Number,jp(Adj,N))-->adj(Adj),n(Number,_,N).
jp(Number,jp(Adj,JP))-->adj(Adj),jp(Number,JP).
%pp
pp(pp(Prep,NP))-->prep(Prep),np(object,_,_,_,NP).

pro(Role,Number, Person, pro(Word)) -->
    [Word],
    {lex(Word, pro, Number, Person, Role)}.
v(TI, Number, Person, Animicy,v(Word)) -->
	[Word],
	{lex(Word,TI, Number, Person, Animicy)}.	
det(Number,det(Word)) -->
    [Word],
    {lex(Word, det, Number)}.
n( Number, Animicy,n(Word)) -->
    [Word], 
    {lex(Word, n, Number, Animicy)}.
prep(prep(Word)) -->
    [Word],
    {lex(Word,prep)}.
adj(adj(Word)) -->
    [Word],
    {lex(Word, adj)}.
	
%pro
lex(i, pro, single, first, subject).
lex(you, pro, single, second, subject).
lex(he, pro, single, third, subject).
lex(she, pro, single, third, subject).
lex(it, pro, single, third, subject).
lex(we, pro, plural, first, subject).
lex(you, pro, plural, second, subject).
lex(they, pro, plural, third, subject).
lex(me, pro, single, first, object).
lex(you, pro, single, second, object).
lex(him, pro, single, third, object).
lex(her, pro, single, third, object).
lex(it, pro, single, third, object).
lex(us, pro, plural, first, object).
lex(you, pro, plural, second, object).
lex(them, pro, plural, third, object).
%verbs
lex(know,tv,single,first, ani). 
lex(know,tv,single,second, ani). 
lex(knows,tv,single,third, ani).
lex(know,tv,plural,_, ani).
lex(see,tv,single,first, ani). 
lex(see,tv,single,second, ani). 
lex(sees,tv,single,third, ani). 
lex(see,tv,plural,_, ani). 
lex(hire,tv,single,first, ani). 
lex(hire,tv,single,second, ani).
lex(hires,tv,single,third, ani).
lex(hire,tv,plural,_, ani). 
lex(fall,iv,single,first, _). 
lex(fall,iv,single,second,_). 
lex(falls,iv,single,third, _). 
lex(fall,iv,plural,_, _). 
lex(sleep,iv,single,first, ani). 
lex(sleep,iv,single,second, ani). 
lex(sleeps,iv,single,third, ani). 
lex(sleep,iv,plural,_, ani).
%nouns
lex(man,n,single, ani). 
lex(woman,n,single, ani). 
lex(apple,n,single, inani). 
lex(chair,n,single, inani). 
lex(room,n,single, inani). 
lex(men,n,plural, ani). 
lex(women,n,plural, ani). 
lex(apples,n,plural, inani). 
lex(chairs,n,plural, inani). 
lex(rooms,n,plural, inani).
%det
lex(the, det, _).
lex(a, det, single).
lex(two, det, plural).
%prepositions
lex(on,prep).
lex(in,prep). 
lex(under,prep).
%adjective
lex(old,adj). 
lex(young,adj). 
lex(red,adj). 
lex(short,adj). 
lex(tall,adj).

%Test Sentances 
/*
?- s(Tree,[the,woman,sees,the,apples],[]).
Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) .

?- s(Tree,[a,woman,knows,him],[]).
Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him))))

?- s(Tree,[two,woman,hires,a,man],[]).
false.

?- s(Tree,[two,women,hire,a,man],[]).
Tree = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a), nbar(n(man))))) .

?- s(Tree,[she,knows,her],[]).
Tree = s(np(pro(she)), vp(v(knows), np(pro(her)))) .

?- s(Tree,[she,know,the,man],[]).
false.

?- s(Tree,[us,see,the,apple],[]).
false.

?- s(Tree,[we,see,the,apple],[]).
Tree = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple))))) .

?- s(Tree,[i,know,a,short,man],[]).
Tree = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short), n(man)))))) .

?- s(Tree,[he,hires,they],[]).
false.

?- s(Tree,[two,apples,fall],[]).
Tree = s(np(det(two), nbar(n(apples))), vp(v(fall))) .

?- s(Tree,[the,apple,falls],[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

?- s(Tree,[the,apples,fall],[]).
Tree = s(np(det(the), nbar(n(apples))), vp(v(fall))) .

?- s(Tree,[i,sleep],[]).
Tree = s(np(pro(i)), vp(v(sleep))) .

?- s(Tree,[you,sleep],[]).
Tree = s(np(pro(you)), vp(v(sleep))) .

?- s(Tree,[she,sleeps],[]).
Tree = s(np(pro(she)), vp(v(sleeps))) .

?- s(Tree,[he,sleep],[]).
false.

?- s(Tree,[them,sleep],[]).
false.

?- s(Tree,[a,men,sleep],[]).
false.

?- s(Tree,[the,tall,woman,sees,the,red],[]).
false.

?- s(Tree,[the,young,tall,man,knows,the,old,short,woman],[]).
Tree = s(np(det(the), nbar(jp(adj(young), jp(adj(tall), n(man))))), vp(v(knows), np(det(the), nbar(jp(adj(old), jp(adj(short), n(woman))))))) .

?- s(Tree,[a,man,tall,knows,the,short,woman],[]).
false.

?- s(Tree,[a,man,on,a,chair,sees,a,woman,in,a,room],[]).
Tree = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a), nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman)), pp(prep(in), np(det(a), nbar(n(room))))))) .

?- s(Tree,[a,man,on,a,chair,sees,a,woman,a,room,in],[]).
false.

?- s(Tree,[the,tall,young,woman,in,a,room,on,the,chair,in,a,room,in,the,room,sees,the,red,apples,under,the,chair],[]).
Tree = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the), nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...)), pp(prep(...), np(..., ...))))))))), vp(v(sees), np(det(the), nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the), nbar(n(chair))))))) .

?- s(Tree,[the,woman,sees,the,apples],[]).
Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) .

?- s(Tree,[a,woman,knows,him],[]).
Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

?- s(Tree,[the,man,sleeps],[]).
Tree = s(np(det(the), nbar(n(man))), vp(v(sleeps))) .

?- s(Tree,[the,room,sleeps],[]).
false.

?- s(Tree,[the,apple,sees,the,chair],[]).
false.

?- s(Tree,[the,rooms,know,the,man],[]).
false.

?- s(Tree,[the,apple,falls],[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

?- s(Tree,[the,man,falls],[]).
Tree = s(np(det(the), nbar(n(man))), vp(v(falls))) .
*/