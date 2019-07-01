# EpmdlessElixirExample

A tiny example, which demonstrates how to setup EPMDLess with TLS support for
Elixir. Please note that certificates are provided for demonstration only
purposes. Please generate own certificates for production.

## Demo

 1. mix deps.get
 2. mix compile

And now in terminal A do:
```
ERL_LIBS=_build/dev/lib/ EPMDLESS_DIST_PORT=17012 iex --cookie 123 --name "a@127.0.0.1" --erl "-proto_dist epmdless_proto" --erl "-start_epmd false"  --erl "-epmd_module epmdless_client" -S mix
```

And in terminal B do:

```
ERL_LIBS=_build/dev/lib/ EPMDLESS_DIST_PORT=17013 iex --cookie 123 --name "b@127.0.0.1" --erl "-proto_dist epmdless_proto" --erl "-start_epmd false"  --erl "-epmd_module epmdless_client" -S mix
```

Now after you have started two Elixir applications, you can connect them in the
following way:

Go to terminal A and do:

```
iex(a@127.0.0.1)1> :epmdless_dist.add_node(:'b@127.0.0.1', 17013)
:ok
iex(a@127.0.0.1)2> :net_adm.ping(:'b@127.0.0.1')

=PROGRESS REPORT==== 1-Jul-2019::11:09:50 ===
          supervisor: {local,inet_gethost_native_sup}
             started: [{pid,<0.174.0>},{mfa,{inet_gethost_native,init,[[]]}}]

=PROGRESS REPORT==== 1-Jul-2019::11:09:50 ===
          supervisor: {local,kernel_safe_sup}
             started: [{pid,<0.173.0>},
                       {id,inet_gethost_native_sup},
                       {mfargs,{inet_gethost_native,start_link,[]}},
                       {restart_type,temporary},
                       {shutdown,1000},
                       {child_type,worker}]
:pong
iex(a@127.0.0.1)3>

```

That's all.

## Note... unclear part

Ot looks like it does not work without sys.config file written in Erlang style.
