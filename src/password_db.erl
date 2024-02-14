% password_db.erl

-module(password_db).
-export([store_password/2, get_password/1]).

store_password(Username, Password) ->
    file:write_file(Username, Password).

get_password(Username) ->
    {ok, Password} = file:read_file(Username),
    Password.

