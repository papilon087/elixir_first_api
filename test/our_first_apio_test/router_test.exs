defmodule OurFirstApioTest.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts OurFirstApi.Router.init([])

  #Teste para vermos se estamos conectados com a API.
  test "return ok" do
    build_conn = conn(:get, "/")
    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  #Teste para a segunda rota criada.
  test "return Blorks Erlang" do
    build_conn = conn(:get, "/aliens_name")
    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Blorks Erlang"
  end
end
