### LIN spec

pn
$\mathfrak{\color{cyan}{|}}$
[player_nick_S]
$\mathfrak{\color{white}{,}}$
[player_nick_W]
$\mathfrak{\color{white}{,}}$
[player_nick_N]
$\mathfrak{\color{white}{,}}$
[player_nick_E]
$\mathfrak{\color{cyan}{|}}$
st
$\mathfrak{\color{red}{||}}$
md
$\mathfrak{\color{cyan}{|}}$
[dealer][cards of S]
$\mathfrak{\color{white}{,}}$
[cards of W]
$\mathfrak{\color{white}{,}}$
[cards of N]
$\mathfrak{\color{white}{,}}$
$\mathfrak{\color{cyan}{|}}$
rh
$\mathfrak{\color{red}{||}}$
ah
$\mathfrak{\color{cyan}{|}}$
[board's name]
$\mathfrak{\color{cyan}{|}}$
sv
$\mathfrak{\color{cyan}{|}}$
[vul]
$\mathfrak{\color{cyan}{|}}$
\[bids\]
$\mathfrak{\color{cyan}{|}}$
[game record]
$\mathfrak{\color{cyan}{|}}$

- [player_nick_X]: If player is a robot, the name is preceded by '~~'. Example: ~~M54586. Idk if the robot's 'name' has
  to have any specific format.

- [dealer]: 1 = S, 2 = W, 3 = N, 4 = E

- [cards of X] in format: SxxxHxxxDxxxCxxx

  note that there is a coma after N-th player's cards

- [vul]: o = none, n = NS, b = both, e = EW

- \[bids\]:

  mb
  $\mathfrak{\color{white}{|}}$
  \[bid\]
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  bid
  $\mathfrak{\color{white}{|}}$
  mb...

  Example:

  mb
  $\mathfrak{\color{white}{|}}$
  3H
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  4H
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  d
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  4S
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  d
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p

  if bid is alerted:

  mb
  $\mathfrak{\color{white}{|}}$
  \[bid!\]
  $\mathfrak{\color{white}{|}}$
  an
  $\mathfrak{\color{white}{|}}$
  [alert message]

  example:

  mb
  $\mathfrak{\color{white}{|}}$
  1H
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  2N!
  $\mathfrak{\color{white}{|}}$
  an
  $\mathfrak{\color{white}{|}}$
  inv+fit
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  4H
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p
  $\mathfrak{\color{white}{|}}$
  mb
  $\mathfrak{\color{white}{|}}$
  p

- [game record]

  Successive tricks divided with pg, next cards divided with pc, claim = mc and number of tricks claimed after that

  Example:

  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  DQ
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D3
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D2
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  DA
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  H2
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  H4
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  HA
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  H8
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  DK
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D5
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  S4
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D4
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  DT
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D6
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  HT
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D7
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  H3
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D8
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  HK
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  HQ
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  S5
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  SA
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  ST
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  S2
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  S3
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  SK
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  S7
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  S6
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  H5
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  DJ
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  H9
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  D9
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  pc
  $\mathfrak{\color{white}{|}}$
  C2
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  C3
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  CK
  $\mathfrak{\color{white}{|}}$
  pc
  $\mathfrak{\color{white}{|}}$
  C4
  $\mathfrak{\color{white}{|}}$
  pg
  $\mathfrak{\color{white}{||}}$
  mc
  $\mathfrak{\color{white}{|}}$
  11
  $\mathfrak{\color{cyan}{|}}$

note that there are two
$\mathfrak{\color{white}{|}}$
after each 'pg'.

The game can also end by the claim in the middle of the claim:

...
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
CA
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
CJ
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
CT
$\mathfrak{\color{white}{|}}$
mc
$\mathfrak{\color{white}{|}}$
7
$\mathfrak{\color{white}{|}}$

- What I still do not know: 'st', 'rh', 'ah'. All tables I've seen had those values unchanged.

- sv stands for 'set vulnerability'. the vulnerability is given next.

- pn stands for player names. The player names are given next. It is not mandatory to put it in lin.

- md stands for 'make deal'. The deal details are given next.

- pg is a page break (don't exactly know what that means).

- qx
  $\mathfrak{\color{white}{|}}$
  $\mathfrak{\color{white}{|}}$
  can be added at the beginning of lin string - it allows to put multiple lin strings in one file. Each of them should
  begin with qx.

  Example:
  qx
  $\mathfrak{\color{white}{|}}$
  $\mathfrak{\color{white}{|}}$
  pn
  $\mathfrak{\color{white}{|}}$
  [player_nick_S]...

  ---

Complete example:

pn
$\mathfrak{\color{cyan}{|}}$
krysieq
$\mathfrak{\color{white}{,}}$
uijallen
$\mathfrak{\color{white}{,}}$
ElMacaroni
$\mathfrak{\color{white}{,}}$
Player1771
$\mathfrak{\color{cyan}{|}}$
st
$\mathfrak{\color{red}{||}}$
md
$\mathfrak{\color{cyan}{|}}$
3S865HAK9DKT3CJ862
$\mathfrak{\color{white}{,}}$
SAQ3HQ8D9652CA753
$\mathfrak{\color{white}{,}}$
SKT4HJT76532DACKT
$\mathfrak{\color{white}{,}}$
$\mathfrak{\color{cyan}{|}}$
rh
$\mathfrak{\color{red}{||}}$
ah
$\mathfrak{\color{cyan}{|}}$
Board 1
$\mathfrak{\color{cyan}{|}}$
sv
$\mathfrak{\color{cyan}{|}}$
o
$\mathfrak{\color{cyan}{|}}$
mb
$\mathfrak{\color{white}{|}}$
1H
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
p
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
2N!
$\mathfrak{\color{white}{|}}$
an
$\mathfrak{\color{white}{|}}$
inv+fit
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
p
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
4H
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
p
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
p
$\mathfrak{\color{white}{|}}$
mb
$\mathfrak{\color{white}{|}}$
p
$\mathfrak{\color{cyan}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
DQ
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D3
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D2
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
DA
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
H2
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
H4
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
HA
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
H8
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
DK
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D5
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
S4
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D4
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
DT
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D6
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
HT
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D7
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
H3
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D8
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
HK
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
HQ
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
S5
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
SA
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
ST
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
S2
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
S3
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
SK
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
S7
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
S6
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
H5
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
DJ
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
H9
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
D9
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
pc
$\mathfrak{\color{white}{|}}$
C2
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
C3
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
CK
$\mathfrak{\color{white}{|}}$
pc
$\mathfrak{\color{white}{|}}$
C4
$\mathfrak{\color{white}{|}}$
pg
$\mathfrak{\color{white}{||}}$
mc
$\mathfrak{\color{white}{|}}$
11
$\mathfrak{\color{cyan}{|}}$

Explanations:

- Players (SWNE): krysieq, uijallen, ElMacaroni, Player1771
- Dealer: N
- Players' cards (SWN): S865HAK9DKT3CJ862, SAQ3HQ8D9652CA753, SKT4HJT76532DACKT
- Name of the board: Board 1
- Vul: none
- Bidding: 1H-P-2N!-P-4H-P-P-P, 2N alerted: 'inv+fit'
- Lead: DQ
- Game record: DQ, D3, D2, DA, ..., CK, C4, claim: 11 tricks

