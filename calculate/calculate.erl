-module(calculate).
-export([loop/0, start/0]).

%创建新进程，并执行 loop 函数。
start() -> spawn(calculate,loop,[]).

% loop 函数
loop() ->
	receive								%接受消息并匹配
		{plus, Num1, Num2} ->			%匹配加法
			io:format("Num1 plus Num2 result:~p~n",[Num1 + Num2]),
			loop();
		{reduce, Num1, Num2} ->			%匹配减法
			io:format("Num1 reduce Num2 result:~p~n",[Num1 - Num2]),
			loop();
		{multi, Num1, Num2} ->			%匹配乘法
			io:format("Num1 muli Num2 result:~p~n",[Num1 * Num2]),
			loop();
		{divis, Num1, Num2} ->			%匹配除法
			io:format("Num1 divis Num2 result:~p~n",[Num1 / Num2]),
			loop()
	after 500000 ->						%超时操作
			io:format("timeout!!")
	end().
