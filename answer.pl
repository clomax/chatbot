:- module(answer,[answer/3]).

:- op(100,xfx,'=..').

/* Rules to define the compositions of an answer given the question's parse tree */
answer(Number,ParseTree,Reply) :-
  ParseTree = question(noun(N),verb(V)),
  Command =.. [V,N,A],                    % Produce a predicate to call from the components of the parse tree
  call(Command),
  append([],[N,V,A],Reply).               % Construct the list of words representing the full-worded answer to the question
  
answer(Number,ParseTree,Reply) :-
  ParseTree = question(noun_phrase(determiner(D),noun(N)),verb(V)),
  Command =.. [V,N,A],
  call(Command),
  append([],[D,N,V,D,A],Reply).

answer(Number,ParseTree,Reply) :-
  ParseTree = question(noun(N),descriptor(Dc)),
  Command =.. [Dc,N,A],
  call(Command),
  isos(Number,I), 
  append([],[N,I,A],Reply).

answer(Number,ParseTree,Reply) :-
  ParseTree = question(noun_phrase(determiner(D),noun(N)),descriptor(Dc)),
  Command =.. [Dc,N,A],
  call(Command),
  isos(Number,I), 
  append([],[D,N,I,A],Reply).

