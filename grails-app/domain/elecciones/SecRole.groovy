package elecciones

class SecRole {

	String authority
    String descripcionRol

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}

    String toString(){       
      return descripcionRol
    }
}
