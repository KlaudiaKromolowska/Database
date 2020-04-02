Suma b i c zawiera się w a : {A} -> {B, C} .

8.1 Dana jest relacja R o schemacie H = {P,O,E,B,K}: 
F = {{P,O} → E, {P,E} → O, {P,O} → B, B → K} 

{P}+ = {P}
{P,O}+ = {E, B, K, P, O} - klucz
{P,E}+ = {O, E, B, K, P} - klucz
{P,B}+ = {P, B, K}

F+ = {{P,O} → K, {P,E} → B, {P,E} → K, {P,O,E} → B, {P,O,E} → K}

8.2 
1.P → E - nie należy do F+
2.{P,K} → B - nie należy
3.{P,E} → B - należy
4.{P,E,O} → K - należy
5.B → O - nie należy
6.{P,E} → {K,B} - należy

8.3
1.F = { C → {A,B}, E → {A,D}, C → D, E → B }
Fmin = {C → {A,B,D}, E → {A,D,B}}

2.F = { A → B, A → C, {A,B} → D, {A,C} → {B,D} }.
Fmin = {A → {B,C,D}}

3.F = { A → B, B → C, A → C, C → A, C → B, B → A }.
Fmin = {A → B, B → C, C → B,  B → A }

8.4 Dana jest relacja R o schemacie H = {A,C,G,N,S,R,T}
% Żeby sprawdzić czy komp jest bezstr to czy H1 lub H2 się w nim zawiera
F = {{S,T} → R, {R,T} → C, {R,T} → S, {A,T} → G, {A,T} → N, {N,R,T} → A}

H1 = {A,G,N,R,T}, H2 = {C,R,S,T}
H1 ∩ H2 = {R,T}
{R,T}+ = {R,T,C,S} = H2 - bezstratna
	A	C	G	N	S	R	T
H1	1	2	1	1	2	1	1
H2		1			1	1	1

H1 = {A,G,N,T}, H2 = {C,R,S,T}
	A	C	G	N	S	R	T
H1	1		1	1			1
H2		1			1	1	1

H1 = {A,G,N,S,T}, H2 = {C,R,S,T}
	A	C	G	N	S	R	T
H1	1	3	1	1	1	2	1
H2		1			1	1	1


% dopiero przy 3 elementach konieczna tabelka

H1 = {A,G,S,T}, H2 = {A,N,R,T}, H3 = {C,S,R,T}
	A	C	G	N	S	R	T
H1	~	+	~	+	~	+	~
H2	~			~		~	~
H3		~			~	~	~
jeden z rzędów się zapełnił - bezstratna

H1 = {A,G,T}, H2 = {A,N,T}, H3 = {C,S,R,T}
	A	C	G	N	S	R	T
H1	*		*	+			*
H2	*		+	*			*
H3		*			*	*	*
rzaden rząd się nie zapełnił - stratna

H1 = {A,G,S,T}, H2 = {A,N,T}, H3 = {C,S,R,T}
	A	C	G	N	S	R	T
H1	*	+	*	+	*	+	*	
H2	*			*			*	
H3		*			*	*	*
bezstratna 

8.5 Dana jest relacja R o schemacie H = {M,P,S,T}
F = {{S,T} → M, M → P, P → S}
bezstratność to nie to samo co utrzymanie zal. funkcjyjnych

b) H1 = {M,S,T}, H2 = {P,S}
{M}→{M,P,S}, {P}→{P,S}, {S}→{S}, {T}→{T}, {S,T}→S,T,M,P{}, {M,T}→{M,P,S,T}, {P,S}→{P,S}, {M,S}→{M,P,S}, {M,P}→{M,S,P}

PiH1(f):
{M}→{S}
{S,T}→{M}
{M,T}→{S}

PiH2(f):
{P}→{S}

nie zachowuje zal. funkcyjnych
a)
H1 = {M,S,T}, H2 = {M,P,S}
{M}→{M,P,S}, {P}→{P,S}, {S}→{S}, {T}→{T}, {S,T}→S,T,M,P{}, {M,T}→{M,P,S,T}, {P,S}→{P,S}, {M,S}→{M,P,S}, {M,P}→{M,S,P}

A = πH1(F) (relacje z F, w których skład wchodzą tylko M,S lub T) = {{S,T} → M}
B = πH2(F) = {M → P, P → S}


c)
H1 = {M,S,T}, H2 = {P,S}
A = πH1(F) = {{S,T} → M}
B = πH2(F) = {P → S}
A ∪ B = F - {M → P}
{M}+ = {M} – nie zachowuje zależności funkcyjnych

H1 = {M,P,S}, H2 = {S,T}
A = πH1(F) = {M → P, P → S}
B = πH2(F) = ∅
A ∪ B = F - {{S,T} → M}
{S,T}+ = {S,T} – nie zachowuje zależności funkcyjnych


8.6 Dana jest relacja R (1NF) o schemacie H = {M,P,S,T}
F = {{S,T} → M, M → P, P → S}

8.5
1. warunkiem postaci 1 - tylko wart niepodzielne, atomowe, 1NF
2. piszemy dopełnienia: jeżeli coś jest po prawej a nie po lewej... sposób hindusa <3
{S,T}→{M,P,T,S}, {M,P}→{M,P,T,S}, {T,P}→{M,P,T,S}
3. KLUCZOWE: {M,P,S,T}
NIEKLUCZOWE: brak
4. warunek na 2NF - kazdy niekluczowy zalezy od całego klucza czyli 2NF
5.wszystkie el. F mają po lewej posiadać nadklucze/atrybuty z kluczy 3NF
6. nie jest w bcnf (dla kazdej zależności lewa jest nadkluczem) NIE BCNF
każdy z pkt rozpatrujemy wg tych literek kluczowych


8.7
{G,T}→{G,T,W,P}
{P,T}→{G,T,W,P}
KLUCZOWE: GTP
NIEKLUCZOWE: W
- nie 2nf
- nie 3nf
 

