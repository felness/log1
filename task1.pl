%1
length([], 0).
length([_|T], N) :- length(T, K), N is K + 1.
%2
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).
%3
append([], L, L).
append([H|T], L, [H|Result]) :- append(T, L, Result).
%4
remove(_, [], []).
remove(X, [X|T], Result) :- remove(X, T, Result).
remove(X, [H|T], [H|Result]) :- X \= H, remove(X, T, Result).
%5
permute([], []).
permute(List, [H|Perm]) :- select(H, List, Rest), permute(Rest, Perm).
%6
sublist(Sublist, List) :- append(_, Rest, List), append(Sublist, _, Rest).
%7.1
tail_separator_(List, Value, Result) :- 
    append(_, [Value|Result], List).
%7.2
tail_separator_my([], _, []).
tail_separator_my([H|T], Value, Result) :-
    H \= Value,
    tail_separator_my(T, Value, Result).
tail_separator_my([Value|T], Value, T).
%8.1
list_product(List, Product) :-
    product_list(List, 1, Product).

product_list([], Product, Product).
product_list([H|T], Accumulator, Product) :-
    NewAccumulator is Accumulator * H,
    product_list(T, NewAccumulator, Product).
%8.2
list_product_my([], 1).
list_product_my([H|T], Product) :-
    list_product_my(T, RestProduct),
    Product is H * RestProduct.
