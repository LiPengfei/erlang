-module(double).
-export([double_all/1]).

double_all([])->[];
double_all([First|Rest]) -> [First * 2 | double_all(Rest)].
