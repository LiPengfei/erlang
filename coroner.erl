-module(coroner).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        {monitor, Process} ->
            link(Process),
            io:format("Monitoring process. ~n"),
            loop();

        {'EXIT', From, Reason} ->
            io:format("The shooter ~p die with reason ~p.", [From, Reason]),
            io:format(" Restarting. ~n"),
            loop()
    end.
