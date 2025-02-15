:- use_module(filters).

:- object(filters, extends(lgtunit)).

    test(lower) :- filters:filter_lower("AbC", "abc").
    test(upper) :- filters:filter_upper("aBc", "ABC").
    test(length) :- filters:filter_length("abc  ", "5").
    test(wordcount) :- filters:filter_wordcount("  hola  amigos de   Perú", "4").
    test(capitalize) :- filters:filter_capitalize("abc", "Abc").
    test(trim) :- filters:filter_trim("     hola amigos  ", "hola amigos").
    test(trim_start) :- filters:filter_trim_start("     hola amigos  ", "hola amigos  ").
    test(trim_end) :- filters:filter_trim_end("     hola amigos  ", "     hola amigos").
    test(truncate) :- filters:filter_truncate("hola amigos", "hola", ["length"-number("4")]).
    test(first) :- filters:filter_first([1,2,3], 1).
    test(last) :- filters:filter_last([1,2,3], 3).
    test(nth) :- filters:filter_nth([1,2,3], 2, ["n"-number("1")]).
    test(replace) :- filters:filter_replace("hola amigos", "adios amigos", ["from"-string("hola"), "to"-string("adios")]).
    test(title) :- filters:filter_title("hola amigos  cruel", "Hola Amigos Cruel").
    test(join) :- filters:filter_join(["hola", "amigos", "cruel"], "hola//amigos//cruel", ["sep"-string("//")]).
    test(reverse) :- filters:filter_reverse("hola amigos", "sogima aloh").
    test(simple_sort) :- filters:filter_sort([4,2,1,3], [1,2,3,4]).
    test(complex_sort) :- filters:filter_sort([["age"-34, "name"-"Pepe"], ["age"-21, "name"-"Marisa"], ["age"-56, "name"-"César"]], [["age"-21, "name"-"Marisa"], ["age"-34, "name"-"Pepe"], ["age"-56, "name"-"César"]], ["key"-string("age")]).
    test(unique) :- filters:filter_unique([1,2,3,1,2,3], [1,2,3]).

:- end_object.