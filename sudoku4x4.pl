:-use_module(library(clpfd)).
sudoku4(Rows) :-
    length(Rows, 16),
    maplist(same_length(Rows), Rows),
    append(Rows, Vs), Vs ins 1..16,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is,Js,Ks,Ls,Ms,Ns,Os,Ps],
    blocks(As, Bs, Cs, Ds),
    blocks(Es, Fs, Gs, Hs),
    blocks(Is, Js, Ks, Ls),
    blocks(Ms, Ns, Os, Ps).

blocks([], [], [], []).
blocks([N1,N2,N3,N4|Ns1],
       [N5,N6,N7,N8|Ns2],
       [N9,N10,N11,N12|Ns3],
       [N13,N14,N15,N16|Ns4]) :-
    all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]),
    blocks(Ns1, Ns2, Ns3, Ns4).
