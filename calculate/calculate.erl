-module(calculate).
-export([start/0, loop/0]).

start() -> spawn(calculat,loop,[]).

loop() ->
	receive
		{plus, Num1, Num2} ->
			io:format("Num1 plus Num2 result:~p~n",[Num1 + Num2]),
			loop();
		{reduce, Num1, Num2} ->
			io:format("Num1 reduce Num2 result:~p~n",[Num1 - Num2]),
		{muli, Num1, Num2} ->
			io:format("Num1 muli Num2 result:~p~n"),[Num1 * Num2]),
	end().
