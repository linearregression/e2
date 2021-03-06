-module(mydb_db).

-export([open/1, put/3, get/2, del/2]).

open(File) ->
    dets:open_file(File, []).

put(Db, Key, Value) ->
    dets:insert(Db, {Key, Value}).

get(Db, Key) ->
    handle_dets_lookup(dets:lookup(Db, Key)).

del(Db, Key) ->
    dets:delete(Db, Key).

handle_dets_lookup([{_Key, Value}]) -> {ok, Value};
handle_dets_lookup([]) -> error.
