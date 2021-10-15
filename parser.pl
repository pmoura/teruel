:- module(parser, [parser//1]).

:- use_module(library(lists)).

% Try to implement most of Tera: https://tera.netlify.app/docs/#templates
% TODO: parse expr
parser(node(expr(X), Xs)) -->
    "{{ ",
    string_(X),
    {
        length(X, N),
        N > 0
    },
    " }}",
    parser(Xs).

% statements
parser(node(raw(X), Xs)) -->
    "{% raw %}",
    raw_string_(X),
    "{% endraw %}",
    parser(Xs).

% comments
parser(Xs) -->
    "{#",
    raw_string_(_),
    "#}",
    parser(Xs).

% normal text
parser(node(text(X), Xs)) -->
    string_(X),
    {
        length(X, N),
        N > 0
    },
    parser(Xs).

parser([]) --> [].

string_([X|Xs]) -->
    [X],
    {
        \+ member(X, ['{', '}', '%'])
    },
    string_(Xs).

string_([]) -->
    [].

raw_string_([X|Xs]) -->
    [X],
    raw_string_(Xs).

raw_string_([]) -->
    [].