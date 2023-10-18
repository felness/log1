% length- длина списка % member-проверяет является ли элемент частью списка % append конкетенирует два списка
length([], 0).
length([_|T], N) :- length(T, K), N is K + 1.

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

append([], L, L).
append([H|T], L, [H|Result]) :- append(T, L, Result).