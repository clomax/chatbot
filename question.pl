:- module(question,[question/4]).

% Definitions that beloing exclusively to questions
qstn --> [what].
q_mark --> [?].

% DCP production rules to match various parts of a question and 'return' its parse tree
question(Number, question(NP,X)) -->
  qstn,
  dummy_verb(Number),
  noun_phrase(Number, NP),
  verb(X),
  q_mark.

question(Number, question(NP,X)) -->
  question_phrase(X),
  isos(Number),
  noun_phrase(Number, NP),
  q_mark.

question_phrase(D) -->
  qstn,
  descriptor(D).

noun_phrase(Number,Noun) -->
  noun(Number,Noun).

noun_phrase(Number, noun_phrase(Det,Noun)) -->
  determiner(Det),
  noun(Number,Noun).

