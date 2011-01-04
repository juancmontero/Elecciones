package elecciones

class Votos {

  Date fechaVoto;
  ListaNominal persona;

    static constraints = {
      idxVoto(unique:['persona'])
    }
}
