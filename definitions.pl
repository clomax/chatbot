%% ---------------------------------------------- %%
%   Chatbot in Prolog                              %
%       Craig Lomax                                %
%% ---------------------------------------------- %%


determiner(determiner(a)) --> [a].
determiner(determiner(the)) --> [the].

% Definition of individual nouns in a way suitable for use in DCG.
% Basic definition of an object would be 'noun(object)' but these
%  definitions make visible, throughout the parse tree, the object
%  being referred to as well as giving them a grammatical number.
noun(singular, noun(tadpole)) --> [tadpole].
noun(singular, noun(frog)) --> [frog].
noun(plural, noun(tadpoles)) --> [tadpoles].
noun(plural, noun(frogs)) --> [frogs].

% Wildcard argument allow for generating parse tree of a given question
verb(verb(become)) --> [become].
verb(verb(become)) --> [turn,into].

% Production rules to recognise the use of
%  isos ('to be') in a given question
isos(singular) --> [is].
isos(plural) --> [are].

isos(singular,is).
isos(plural,are).

dummy_verb(singular) --> [does].
dummy_verb(plural) --> [do].

descriptor(descriptor(colour)) --> [colour].

verb(singular,become,X) --> [becomes].
verb(plural,become,X) --> [become].
