-module(ppool).
-export([start/2, stop/1]).
-export([start_pool/3,stop_pool/1]).
-export([run/2,sync_queue/2,async_queue/2]).


%% ppool API


%% start_link()->
%% ppool_supersuper:start_link()
%%     .

  %% start/2 返回{ok, Pid} or {ok, Pid, SomeState}
%% replace it with
start(normal,_Args)->
    ppool_supersuper:start_link()
    .

%% stop()->
%%     ppool_supersuper:stop().
%% replace with
%% look {mod . ...} ppool.app.src for detail
stop(_State)->
    %% 此处不用自行处理stop ,因start/2 返回值有Pid ,stop 时，OTP 会处理.
    %%     ppool_supersuper:stop().
    ok
        .


stop_pool(PoolName)->
ppool_supersuper:stop_pool(PoolName).

start_pool(PoolName,PoolSize,MFA4worker)->
    ppool_supersuper:start_pool(PoolName,PoolSize,MFA4worker).
run(Name,Args)->
    ppool_serv:run(Name,Args)
        .
sync_queue(Name,Args)->
    ppool_serv:sync_queue(Name,Args)
        .
async_queue(Name,Args)->
    ppool_serv:async_queue(Name,Args)
        .
