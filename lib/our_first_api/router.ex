defmodule OurFirstApi.Router do
  use Plug.Router

  #Conferir todos os logs trazidos pela API.
  plug(Plug.Logger)

  #Combinar as solicitações dos endPoints definiidos.
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    parsers: ["application/json"],
    json_decoder: Jason
  )

  #Despacha a coneção para um manipulador de correspondencia.
  plug(:dispatch)

  #Rota padrão.
  get "/", do: send_resp(conn, 200, "OK")

  #Nova rota criada.
  get "/aliens_name", do: send_resp(conn, 200, "Blorks Erlang")

  #Qualquer erro que atinguirmos retornará.
  match _, do: send_resp(conn, 404, "Not Found")
end
