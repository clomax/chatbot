[knowledge].             % Predicates describing relations the chatbot knows about
[definitions].           % Definitions of various componenets of a sentence
:- use_module(question).
:- use_module(answer).

ask(Input,Answer) :-
  question(Number,ParseTree,Input,[]),  % Interpret the meaning of the question, give back the parse tree.
  answer(Number,ParseTree,Answer).      % Given the parse tree (and grammatical number) produce an answer to the question.

