package elecciones

class SecUser {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    //Agregados para tener mas informacion del usuario
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String email
    String telefonoCelular
    String telefonoCasa

	static constraints = {
		username blank: false, unique: true
		password blank: false
        //Validaciones adicionales
        nombre blank: false
        apellidoPaterno blank: false
        email blank: false
        apellidoMaterno blank: true, nullable:true
        telefonoCelular blank: true,nullable:true
        telefonoCasa blank: true, nullable:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
	}

    String toString(){
    return "[" + username + "] " + nombre + " " +apellidoPaterno
  }
}
