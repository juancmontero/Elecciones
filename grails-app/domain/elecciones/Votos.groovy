package elecciones

class Votos {

  Date fechaVoto;
  ListaNominal persona;

    static constraints = {
      persona(unique:true)
    }
}
