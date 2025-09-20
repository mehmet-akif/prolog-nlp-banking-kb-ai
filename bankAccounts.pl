% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Akif Sipahi
%%%%% NAME: Enes Polat
%%%%% NAME: Ekrem Yilmaz
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%


%%%%% SECTION: database
%%%%% Put statements for account, created, lives, location and gender below

account(12, ayse, metro_credit_union, 4505).
account(13, ahmet, rbc, 750).
account(14, murat, cibc, 4050).
account(18, murat, cibc, 1029).
account(15, merve, bank_of_montreal, 10900).
account(16, elif, bank_of_america, 400).
account(17, yusuf, rbc, 2500).
account(19, ali, scotiabank, 3238).
account(20, hakan, hsbc, 329944).
account(21, esra, citibank, 8900).
account(22, selin, western_bank, 12342).
account(23, can, wellsFargo, 31313).
account(24, burak, bank_of_montreal, 100).
account(25, emre, rbc, 100).
account(26, kemal, bank_of_montreal, 100).

created(12, ayse, metro_credit_union, 3, 2020).
created(13, ahmet, rbc, 7, 1996).
created(14, murat, cibc, 5, 2015).
created(18, murat, cibc, 2, 2001).
created(15, merve, bank_of_montreal, 8, 2006).
created(16, elif, bank_of_america, 4, 1993).
created(17, yusuf, rbc, 1, 2023).
created(19, ali, scotiabank, 6, 1990).
created(20, hakan, hsbc, 9, 2004).
created(21, esra, citibank, 10, 2002).
created(22, selin, western_bank, 12, 2024).
created(23, can, wellsFargo, 11, 1999).
created(24, burak, bank_of_montreal, 3, 1997).
created(25, emre, rbc, 4, 2024).
created(26, kemal, bank_of_montreal, 12, 1984).

lives(ayse, markham).
lives(ahmet, losAngeles).
lives(murat, richmondHill).
lives(merve, montreal).
lives(elif, sanFrancisco).
lives(yusuf, richmondHill).
lives(ali, northYork).
lives(hakan, edmonton).
lives(esra, texas).
lives(selin, vancouver).
lives(can, chicago).
lives(burak, scarborough).
lives(emre, london).
lives(kemal, losAngeles).

location(scarborough, canada). 
location(markham, canada).
location(richmondHill, canada).
location(montreal, canada).
location(sanFrancisco, usa).
location(northYork, canada).
location(edmonton, canada).
location(texas, usa).
location(vancouver, canada).
location(chicago, usa).
location(london, united_kingdom).
location(toronto, canada).
location(losAngeles, usa).

location(rbc, toronto).
location(metro_credit_union, scarborough).
location(cibc, markham).
location(bank_of_montreal, montreal).
location(bank_of_america, sanFrancisco).
location(scotiabank, edmonton).
location(hsbc, northYork).
location(citibank, texas).
location(western_bank, vancouver).
location(wellsFargo, chicago).

gender(ayse, woman).
gender(ahmet, man).
gender(murat, man).
gender(merve, woman).
gender(elif, woman).
gender(yusuf, man).
gender(ali, man).
gender(hakan, man).
gender(esra, woman).
gender(selin, woman).
gender(can, man).
gender(burak, man).
gender(emre, man).
gender(kemal, man).

%%%%% SECTION: lexicon
%%%%% Put the rules/statements defining articles, adjectives, proper nouns, common nouns,
%%%%% and prepositions in this section.
%%%%% You should also put your lexicon helpers in this section
%%%%% Your helpers should include at least the following:
%%%%%       bank(X), person(X), man(X), woman(X), city(X), country(X)
%%%%% You may introduce others as you see fit
%%%%% DO NOT INCLUDE ANY statements for account, created, lives, location and gender 
%%%%%     in this section

% article
article(a).
article(an).
article(the).
article(any).

%helpers
person(Person) :- account(_, Person, _, _).
man(Man) :- gender(Man, man).
woman(Woman) :- gender(Woman, woman).
city(City) :- location(City, _), not account(_, _, City, _).
country(Country) :- location(_, Country), not city(Country).
bank(Bank) :- account(_, _, Bank, _).


% common noun
common_noun(city, City) :- city(City).
common_noun(country, Country) :- country(Country).
common_noun(man, Man) :- man(Man).
common_noun(woman, Woman) :- woman(Woman).
common_noun(person, Person) :- person(Person).
common_noun(bank, Bank) :- bank(Bank).
common_noun(owner, Owner) :- created(_, Owner, _, _, _).
common_noun(account, Account) :- account(Account, _, _, _).
common_noun(balance, Balance) :- account(_, _, _, Balance).

common_noun(american, X) :- adjective(american, X), person(X).
common_noun(canadian, X) :- adjective(canadian, X), person(X).
common_noun(british, X) :- adjective(british, X), person(X).

%proper noun
proper_noun(X) :- person(X).
proper_noun(X) :- bank(X).
proper_noun(X) :- account(X,_,_,_).
proper_noun(X) :- country(X).
proper_noun(X) :- city(X).
proper_noun(X) :- number(X).

% adjectives
adjective(canadian, City) :- location(City, canada).
adjective(american, City) :- location(City, usa).
adjective(british, City) :- location(City, united_kingdom).
adjective(canadian, Bank) :- location(Bank, City), location(City, canada).
adjective(american, Bank) :- location(Bank, City), location(City, usa).
adjective(british, Bank) :-  location(Bank, City), location(City, united_kingdom).
adjective(canadian, Account) :- account(Account, _, Bank, _), adjective(canadian, Bank ).
adjective(american, Account) :- account(Account, _, Bank, _), adjective(american, Bank).
adjective(british, Account) :-  account(Account, _, Bank, _), adjective(british, Bank).
adjective(canadian, Person) :-  lives(Person, City), location(City, canada). 
adjective(american, Person) :-  lives(Person, City), location(City, usa). 
adjective(british, Person) :-  lives(Person, City), location(City, united_kingdom). 
adjective(female, X) :- woman(X).
adjective(male, X) :- man(X).
adjective(local, X) :-  adjective(canadian, X).
adjective(foreign, X) :- adjective(american, X).
adjective(foreign, X) :- adjective(british, X).
adjective(small, A) :- account(A, _, _, Balance), Balance < 1000.
adjective(large, A) :- account(A, _, _, Balance), Balance > 10000.
adjective(medium, A) :- account(A, _, _, Balance), Balance >= 1000, Balance =< 10000.
adjective(new, A) :- account(A, _, _, _), created(A, _, _, _, 2024).
adjective(recent, A) :- adjective(new, A).
adjective(old, A) :- account(A, _, _, _), created(A, _, _, _, Y), Y < 2024.


%Prepositions
preposition(of, X, Y) :- account(X, Y, _, _).    % X is account of owner Y
preposition(of, X, Y) :- account(_, Y, _, X).    % X is balance of owner Y
preposition(of, X, Y) :- account(Y, _, _, X).    % X is balance of account Y
preposition(of, Owner, Account) :- account(Account, Owner, _, _).

preposition(from, A, B) :- lives(A, B).        % X is person from city Y
preposition(from, A, B) :- lives(A, City), location(City, B).

preposition(in, A, B) :- account(A, _, B, _).    % X is account in bank Y
preposition(in, A, B) :- location(A, B).         % X is city/bank in country/city Y
preposition(in, A, B) :- location(A, City), location(City, B).

preposition(with, Bank, Account) :- account(Account, _, Bank, _).
preposition(with, Bank, Person) :- account(_, Person, Bank, _).
preposition(with, Person, Bank) :- account(_, Person, Bank, _).
preposition(with, Person, Account) :-          % Person with Account (direct relationship)
    account(Account, Person, _, _).

preposition(with, Account1, Account2) :-       % Account1 with Account2 (same bank)
    account(Account1, _, Bank, _),
    account(Account2, _, Bank, _),
    not Account1 = Account2.
%preposition(with, Person, Account2) :-         % Person with Account2 (shared bank)
 %   account(Account1, Person, Bank, _),        % Person has Account1
 %   account(Account2, _, Bank, _),             % Account2 is in same bank
 %   not Account1 = Account2. 


%%%%% SECTION: parser
%%%%% For testing your lexicon for question 3, we will use the default parser initially given to you.
%%%%% ALL QUERIES IN QUESTION 3 and 4 SHOULD WORK WHEN USING THE DEFAULT PARSER
%%%%% For testing your answers for question 5, we will use your parser below
%%%%% You may include helper predicates for Question 5 here, but they
%%%%% should not be needed for Question 3
%%%%% DO NOT INCLUDE ANY statements for account, created, lives, location and gender 
%%%%%     in this section

what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).
np([the|Rest], What) :- article(the), np2(Rest, What), not (np2(Rest, What2), not What = What2).
np([Art|Rest], What) :- not Art = the, article(Art), np2(Rest, What).

/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

np2([largest|Rest],What) :- np2(Rest, What), not (np2(Rest,What2), not What = What2, account(What, _, _,B), account(What2, _, _,B2),  not B > B2).
np2([oldest|Rest],What) :- np2(Rest, What), not (np2(Rest,What2), not What = What2, created(What, _, _,M,B), created(What2, _, _,M2,B2), not (not B2 < B, not (B2 = B,  M2 < M))).
np2([Adj|Rest],What) :- not Adj = largest, not Adj = oldest, adjective(Adj,What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).

/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods(Words, What) :-
	appendLists(Start, End, Words),
	prepPhrase(Start, What),	mods(End, What).

betweenHelper([L, and, U|Rest], L, U, Rest) :- number(L), number(U).
between(What, B) :- account(What, _,_,B).
between(What, B) :- account(_, What,_,B).
between(What, B) :- account(_, _,What,B).
between(What, What) :- account(_, _,_,What).

prepPhrase([Prep | Rest], What) :-
	preposition(Prep, What, Ref), np(Rest, Ref).
prepPhrase([between | Rest], What) :- betweenHelper(Rest, L, U, NewRest), between(What, B), NewRest = [], L =< B, B =< U.
prepPhrase([between | Rest], What) :- betweenHelper(Rest, L, U, NewRest), between(What, B),L =< B, B =< U, np(NewRest, What).

appendLists([], L, L).
appendLists([H | L1], L2, [H | L3]) :-  appendLists(L1, L2, L3).































