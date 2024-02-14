% password_manager.erl

-module(password_manager).
-export([start/0]).


start() ->
    io:format("Welcome to Erlang Password Manager~n"),
    io:format("Enter 'store' to save a new password, 'retrieve' to get a password: ~n"),
    Command = io:get_line("Command: "),
    handle_command(Command).

handle_command("store\n") ->
    Username = io:get_line("Enter username: "),
    Password = io:get_line("Enter password: "),
    password_db:store_password(Username, Password),
    io:format("Password stored successfully.~n");

handle_command("retrieve\n") ->
    Username = io:get_line("Enter username: "),
    Password = password_db:get_password(Username),
    io:format("Retrieved password: ~s~n", [Password]);

handle_command(_Command) ->
    io:format("Invalid command.~n"),
    start().
