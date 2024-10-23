%DCG rules
s(s(NP, VP)) --> np(NP, Num), vp(VP, Num).

np(np(DET, N), Num) --> det(DET, Num), n(N, Num).
np(np(PRO), Num) --> pro(PRO, Num).
np(np(DET, ADJ, N), Num) --> det(DET, Num), adj(ADJ), n(N, Num).
np(np(DET),N, Num,Nbar) --> det(DET, Num), nbar(Nbar,N,Num).
np(np(DET, N, PP,Nbar), Num) --> det(DET, Num), nbar(Nbar,N,Num), pp(PP).


vp(vp(V, NP), Num) --> tv(V, Num), np(NP,_).
vp(vp(V), Num) --> iv(V, Num).
vp(vp(V, PP), Num) --> tv(V, Num), pp(PP).
vp(vp(V, NP, PP), Num) --> tv(V, Num), np(NP,_), pp(PP).
vp(vp(V, PP, NP), Num) --> tv(V, Num), pp(PP), np(NP,_).


jp(jp(ADJ1, ADJ2)) --> adj(ADJ1), adj(ADJ2).
jp(jp(ADJ)) --> adj(ADJ).

nbar(nbar(ADJ, N), Num) --> jp(ADJ), n(N, Num).
nbar(nbar(N), Num) --> n(N, Num).

pp(pp(PRE, NP)) --> pre(PRE), np(NP,_).

%Lexical rules

det(det(Word), Num) --> [Word], {lex(Word, det, Num)}.
n(n(Word), Num) --> [Word], {lex(Word, Num,n)}.
pro(pro(Word), Num) --> [Word], {lex(Word, pro, Num,_,_)}.
tv(v(Word), Num) --> [Word], {lex(Word,v, trans, Num, _,_)}.
iv(v(Word), Num) --> [Word], {lex(Word,v, intrans, Num, _,_)}.
adj(adj(Word)) --> [Word], {lex(Word, adj)}.
pre(pre(Word)) --> [Word], {lex(Word, prep)}.

/* s(s(NP, VP)) --> np(NP, Num, Person, Role), vp(VP, Type, Num, Person). 

np(np(DET, N), Num, Person, Role) --> det(DET, Num), nbar(n, Num, Person, Role).
np(np(DET, N, PP), Num, Person, Role) --> det(DET, Num), nbar(n, Num, Person, Role), pp(PP).

vp(vp(V), iv, Num, Person) --> v(V, iv, Num, Person).
vp(vp(V, NP), tv, Num, Person) --> v(V, tv, Num, Person), np(NP, Num, Person, object).

pp(pp(PREP, NP), Num, Person, Role) --> pre(PREP), np(NP, Num, Person, Role).

jp(jp(ADJ1, ADJ2)) --> adj(ADJ1), adj(ADJ2). 
jp(jp(ADJ)) --> adj(ADJ).

nbar(nbar(ADJ, N), Num, Person, Role) --> jp(ADJ), n(N, Num, Person, Role). 
nbar(nbar(N), Num, Person, Role) --> n(N, Num, Person, Role).

prep(prep(Word)) --> [Word], {lex(Word, prep)}.
adj(adj(Word)) --> [Word], {lex(Word, adj)}.
det(det(Word), Num) --> [Word], {lex(Word, det, Num)}.
n(n(Word), Num, Person, Role) --> [Word], {lex(Word, n, Num, Person, Role)}.
n(pro(Word), Num, Person, Role) --> [Word], {lex(Word, pro, Num, Person, Role)}.
v(v(Word), Type, Num, Person) --> [Word], {lex(Word, v, Type, Num, Person)}.
tv(v(Word), Num) --> [Word], {lex(Word,v, trans, Num, _,_)}.
iv(v(Word), Num) --> [Word], {lex(Word,v, intrans, Num, _,_)}. */

% lexicon
%verbs
lex(know,v, trans, s, 1,ani).
lex(know,v, trans, s, 2,ani).
lex(knows,v, trans, s, 3,ani).
lex(know,v, trans, pl,_,ani).
lex(see,v, trans, s, 1,ani).
lex(see,v, trans, s, 2,ani).
lex(sees,v, trans, s, 3,ani).
lex(see,v, trans, pl,_,ani).
lex(hire,v, trans, s, 1,ani).
lex(hire,v, trans, s, 2,ani).
lex(hires,v, trans, s, 3,ani).
lex(hire,v, trans, pl,_,ani).
lex(fall,v, intrans, s, 1,_).
lex(fall,v, intrans, s, 2,_).
lex(falls,v, intrans, s, 3,_).
lex(fall,v, intrans, pl,_,_).
lex(sleep,v, intrans, s, 1,ani).
lex(sleep,v, intrans, s, 2,ani).
lex(sleeps,v, intrans, s, 3,ani).
lex(sleep,v, intrans, pl,_,ani).
%pronouns
lex(i, pro, s, 1, subject).
lex(you, pro, s, 2, subject).
lex(he, pro, s, 3, subject).
lex(she, pro, s, 3, subject).
lex(it, pro, s, 3, subject).
lex(we,pro,pl,1,subject).
lex(you,pro,pl,2,subject).
lex(they,pro,pl,3,subject).
lex(me,pro,s,1,object).
lex(you,pro,s,2,object).
lex(him,pro,s,3,object).
lex(her,pro,s,3,object).
lex(it,pro,s,3,object).
lex(us,pro,pl,1,object).
lex(you,pro,pl,2,object).
lex(them,pro,pl,3,object).
%nouns
lex(man, s, n).
lex(woman, s, n).
lex(apple, s, n).
lex(chair, s, n).
lex(room, s, n).
lex(men, pl, n).
lex(women, pl, n).
lex(apples, pl, n).
lex(chairs, pl, n).
lex(rooms, pl, n).
%determiners
lex(the, det,_).
lex(a, det, s).
lex(two, det, pl).
%adjectives
lex(old, adj).
lex(young, adj).
lex(red, adj).
lex(short, adj).
lex(tall, adj).
%prepositions
lex(in, prep).
lex(on, prep).
lex(under, prep).


%Tests
test(X,S,Tree):- s(Tree, S, []), sentence(X,S).

sentence(1,[the,woman,sees,the,apples]).
sentence(2,[a,woman,knows,him]).
sentence(3,[two,woman,hires,a,man]).%fails
sentence(4,[two,women,hire,a,man]).
sentence(5,[she,knows,her]).
sentence(6,[she,know,the,man]).%fails
sentence(7,[us,see,the,apple]).%fails
sentence(8,[we,see,the,apple]).
sentence(9,[i,know,a,short,man]).
sentence(10,[he,hires,they]).%fails
sentence(11,[two,apples,fall]).
sentence(12,[the,apple,falls]).
sentence(13,[the,apples,fall]).
sentence(14,[i,sleep]).
sentence(15,[you,sleep]).
sentence(16,[she,sleeps]).
sentence(17,[he,sleep]).%fails
sentence(18,[them,sleep]).%fails
sentence(19,[a,men,sleep]).%fails
sentence(20,[the,tall,woman,sees,the,red]).%fails
sentence(21,[the,young,tall,man,knows,the,old,short,woman]).
sentence(22,[a,man,tall,knows,the,short,woman]).%fails
sentence(23,[a,man,on,a,chair,sees,a,woman,in,a,room]).
sentence(24,[a,man,on,a,chair,sees,a,woman,a,room,in]).%fails
sentence(25,[the,tall,young,woman,in,a,room,on,the,chair,in,a,room,in,the,room,sees,the,red,apples,under,the,chair]).
sentence(26,[the,woman,sees,the,apples]).
sentence(27,[a,woman,knows,him]).
sentence(28,[the,man,sleeps]).
sentence(29,[the,room,sleeps]).%fails
sentence(30,[the,apple,sees,the,chair]).%fails
sentence(31,[the,rooms,know,the,man]).%fails
sentence(32,[the,apple,falls]).
sentence(33,[the,man,falls]).










