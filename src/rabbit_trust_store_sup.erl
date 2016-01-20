%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License
%% at http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and
%% limitations under the License.
%%
%% The Original Code is RabbitMQ.
%%
%% The Initial Developer of the Original Code is GoPivotal, Inc.
%% Copyright (c) 2007-2016 Pivotal Software, Inc.  All rights reserved.
%%

-module(rabbit_trust_store_sup).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

-include_lib("rabbit_common/include/rabbit.hrl").


%% ...

start_link() ->

    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% ...

init([]) ->
    {ok,
     {{one_for_one, 1, 5},
      [{trust_store, {rabbit_trust_store, start_link, []},
        permanent, 5 * 1000, worker, [rabbit_trust_store]}]}}.